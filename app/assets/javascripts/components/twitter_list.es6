var TwitterList = React.createClass({
  render: function() {
    var twitterNodes = this.props.data.map(function(tweet) {
      return (
        <Tweet key={tweet.id} createdAt={tweet.createdAt} text={tweet.text} />
      );
    });

    var flashMessage = "";

    if(this.props.httpStatus != 200) {
      flashMessage = (<div className="alert alert-danger" role="alert">{this.props.httpStatusMessage}</div>);
    }

    return (
      <div>
        {flashMessage}
        <div className="list-group">{twitterNodes}</div>
      </div>
    );
  }
});
