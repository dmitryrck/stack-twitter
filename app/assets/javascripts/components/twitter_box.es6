class TwitterBox extends React.Component {
  constructor() {
    super();

    this.state = {
      data: [],
      httpStatus: 200,
      httpStatusMessage: ''
    };
  }

  _handleTwitterSubmit(username) {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'POST',
      data: {
          "account[username]": username,
          "authenticity_token": $('meta[name="csrf-token"]').attr('content')
      },
      success: function(data) {
        this.setState({data: data, httpStatus: 200});
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(xhr);
        this.setState({
          data: [],
          httpStatus: status,
          httpStatusMessage: xhr.responseJSON.errors
        });
      }.bind(this)
    });
  }

  render() {
    return (
      <div className="twitterBox">
        <SearchForm onTwitterSubmit={this._handleTwitterSubmit.bind(this)} />
        <TwitterList data={this.state.data} httpStatus={this.state.httpStatus} httpStatusMessage={this.state.httpStatusMessage} />
      </div>
    );
  }
}
