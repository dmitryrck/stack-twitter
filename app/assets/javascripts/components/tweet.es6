class Tweet extends React.Component {
  render() {
    let time = this.props.createdAt;
    let timeAgo = jQuery.timeago(time);

    return (
      <div className="panel panel-default">
        <div className="panel-heading">
          <time title={time} className="timeago">{timeAgo}</time>
        </div>
        <div className="panel-body" dangerouslySetInnerHTML={{__html: this.props.text}}>
        </div>
      </div>
    );
  }
}
