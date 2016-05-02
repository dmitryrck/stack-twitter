var TwitterList = React.createClass({
  render: function() {
    var twitterNodes = this.props.data.map(function(tweet) {
      return (
        <Tweet key={tweet.id} createdAt={tweet.createdAt} text={tweet.text} />
      );
    });
    return (
      <div className="list-group">{twitterNodes}</div>
    );
  }
});
