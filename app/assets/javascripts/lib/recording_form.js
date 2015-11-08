  function __log(e, data) {
    log.innerHTML += "\n" + e + " " + (data || '');
  }

  function eraseOldRecordings() {
    var recordingsList = document.getElementById('recordingslist');
    recordingsList.innerHTML = '';
  }

  var afterSentHandler = function () {
    console.log('sent');

    var recordButton = document.getElementById('recordButton');
    recordButton.innerHTML = "uploading <i class='fa fa-spinner fa-spin'></i>"
    recordButton.disabled = false

    var sendButton = document.getElementById('sendButton');
    sendButton.innerHTML = "ask to identify it &nbsp;&nbsp; <i class='fa fa-spinner fa-spin'></i>"
    sendButton.disabled = true
  }

  var afterUploadedHandler = function (data) {
    console.log("Audio id: " + data['audio_id']);
    appendAudioIdInput(data['audio_id']);

    var recordButton = document.getElementById('recordButton');
    recordButton.innerHTML = 'I can record it better!'
    recordButton.disabled = false

    var sendButton = document.getElementById('sendButton');
    sendButton.innerHTML = "ask to identify it <i class='fa fa-check'></i>"
    sendButton.disabled = false
  }

  var beforeRecord = function() {
    var recordButton = document.getElementById('recordButton');
    recordButton.innerHTML = 'recording...'
    recordButton.disabled = true

    var sendButton = document.getElementById('sendButton');
    sendButton.innerHTML = "ask to identify it"
    sendButton.disabled = true;

    eraseOldRecordings();
  }

  function appendAudioIdInput(audio_id) {
    var input = document.createElement('input');
    input.setAttribute('type', 'hidden');
    input.setAttribute('name', 'recording_id');
    input.setAttribute('value', audio_id);

    var divForTheInput = document.getElementById('hiddenAudioId');
    divForTheInput.innerHTML = '';
    divForTheInput.appendChild(input);
  }

  var audio_context;
  var recorder;
  function startUserMedia(stream) {
    var input = audio_context.createMediaStreamSource(stream);
    __log('Media stream created.' );
	__log("input sample rate " +input.context.sampleRate);
    __log('Input connected to audio context destination.');
    recorder = new Recorder(
                input,
                {numChannels: 1},
                '/recordings',
                afterSentHandler,
                afterUploadedHandler)
    __log('Recorder initialised.');
  }

  function startRecording(button) {
    beforeRecord();
    recorder && recorder.record();
    button.disabled = true;
    button.nextElementSibling.disabled = false;
    __log('Recording...');
    var maxLength = 15000; // 15s
    setTimeout(function() {
      if (recorder.status()) {
        stopRecording(button.nextElementSibling);
      }
    }, maxLength);
  }

  function stopRecording(button) {
    button.previousElementSibling.innerHTML = "<i class='fa fa-spinner fa-spin'></i>"
    recorder && recorder.stop();
    button.disabled = true;
    //button.previousElementSibling.innerHTML = 'I can record it better!'
    //button.previousElementSibling.disabled = false;
    __log('Stopped recording.');
    // create WAV download link using audio data blob
    createDownloadLink();
    recorder.clear();
  }

  function createDownloadLink() {
    recorder && recorder.exportWAV(function(blob) {
    });
  }

  window.onload = function init() {
    try {
      // webkit shim
      window.AudioContext = window.AudioContext || window.webkitAudioContext;
      navigator.getUserMedia = ( navigator.getUserMedia ||
                       navigator.webkitGetUserMedia ||
                       navigator.mozGetUserMedia ||
                       navigator.msGetUserMedia);
      window.URL = window.URL || window.webkitURL;
      audio_context = new AudioContext;
      __log('Audio context set up.');
      __log('navigator.getUserMedia ' + (navigator.getUserMedia ? 'available.' : 'not present!'));
    } catch (e) {
      alert(e);
      alert('No web audio support in this browser!');
    }
    navigator.getUserMedia({audio: true}, startUserMedia, function(e) {
      __log('No live audio input: ' + e);
    });
  };
