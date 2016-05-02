var TwitterBox = React.createClass({
  handleTwitterSubmit: function(username) {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'POST',
      data: {
          "account[username]": username,
          "authenticity_token": $('meta[name="csrf-token"]').attr('content')
      },
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  getInitialState: function() {
    return {data: []};
  },
  render: function() {
    return (
      <div className="twitterBox">
        <SearchForm onTwitterSubmit={this.handleTwitterSubmit} />
        <TwitterList data={this.state.data} />
      </div>
    );
  }
});
