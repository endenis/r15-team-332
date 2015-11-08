var ServerAPI = {

  baseUrl: function(id) {return "http://localhost:3000/api/questions/" + id + "/answers";},

  getAnswers: function(question_id, callback) {
    $.get(this.baseUrl(question_id), function(results) {
      callback(results);
    });
  },
  postAnswer: function(question_id, title, body, callback){
    $.post(this.baseUrl(question_id), {title: title, body: body}, function(results) {
      if (callback) {
        callback(results);
      }
    });
  }
}

var Answer = React.createClass({
  render: function(){
    return (
      <div className="row">
        <div className="panel"><h2>{this.props.title}</h2><br /><p>{this.props.body}</p></div>
      </div>
    );
  }
})


var AnswerList = React.createClass({
  getInitialState: function() {
        return {answers: []};
  },
  loadAnswersFromServer: function() {
    self = this;
    ServerAPI.getAnswers(this.props.question_id, function(results) {
      var answers = [];
      results.answers.forEach(function(answer){
        answers.push(<Answer title={answer.title} body={answer.body} key={answer.id} />);
      })
      self.setState({answers: answers});
    });
  },
  handleAnswerSubmit: function() {
    this.loadAnswersFromServer();
  },
  componentDidMount: function() {
    this.loadAnswersFromServer();
  },
  render: function() {
    return (
        <div><AnswerForm onAnswerSubmit={this.handleAnswerSubmit} question_id={this.props.question_id} /><div><h1>Answers</h1>{this.state.answers}</div>
        </div>
        )
  }
})

var AnswerForm = React.createClass({
  handleSubmit: function(e) {
    e.preventDefault();
    self = this;
    ServerAPI.postAnswer(this.props.question_id, this.refs.title.value, this.refs.body.value, function(res){
        self.props.onAnswerSubmit();
    });
  },
  render: function() {
    return (
      <form onSubmit={this.handleSubmit}>
        <input type="text" placeholder="Title of the song" ref="title" />
        <input type="text" placeholder="Your comment" ref="body" />
        <input type="submit" value="Post" />
      </form>
    );
  }
});
