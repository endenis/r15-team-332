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
        <div className="answer-block flex-column"><h3 className="answer-author"><b>{ this.props.user }</b> : <span className="created-at"> { this.props.created_at } ago</span></h3><div className="answer-content flex-row"><p className="answer-title">{this.props.title}</p><p className="answer-text">{this.props.body}</p></div></div>
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
      console.log(results)
      var answers = [];
      results.answers.forEach(function(answer){
        if (answer.user != null) {
          var username = answer.user.name;
        }
        else {
          var username = "Anonymous";
        }
        answers.push(<Answer title={answer.title} body={answer.body} key={answer.id} user={ username } created_at={ answer.created_at }/>);
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
        <div className="global"><AnswerForm onAnswerSubmit={this.handleAnswerSubmit} question_id={this.props.question_id} /><div className="answers-list"><p className="title">What others have answered:</p>{this.state.answers}</div>
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
      <form className="flex-column" onSubmit={this.handleSubmit}>
        <p className="answer-text"> You think you know the answer ?</p>
        <div className="inputs flex-row">
          <input type="text" placeholder="Title of the song" ref="title" />
          <input type="text" placeholder="Your comment" ref="body" />
          <button className="btn-dark-small" type="submit" value="Post">
            POST
          </button>
        </div>

      </form>
    );
  }
});
