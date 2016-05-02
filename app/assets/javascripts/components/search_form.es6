var SearchForm = React.createClass({
  getInitialState: function() {
    return {username: ''};
  },
  handleUsernameChange: function(e) {
    this.setState({username: e.target.value});
  },
  handleSubmit: function(event) {
    event.preventDefault();
    var username = this.state.username.trim();
    if (!username) { return; }
    this.props.onTwitterSubmit(username);
  },
  render: function() {
    return (
      <form className="searchForm form-group form-inline" onSubmit={this.handleSubmit}>
        <input
          type="text"
          placeholder="username"
          id="account_username"
          name="account[username]"
          value={this.state.username}
          onChange={this.handleUsernameChange}
          className="form-control"
        />
        <input type="submit" className="btn btn-default" value="Search" />
      </form>
    );
  }
});
