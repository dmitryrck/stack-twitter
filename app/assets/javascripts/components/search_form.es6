class SearchForm extends React.Component {
  constructor() {
    super();

    this.state = {
      username: ''
    };
  }

  _handleUsernameChange(event) {
    this.setState({username: event.target.value});
  }

  _handleSubmit(event) {
    let username = this.state.username.trim();

    event.preventDefault();

    if (!username) { return; }
    this.props.onTwitterSubmit(username);
  }

  render() {
    return (
      <form className="searchForm form-group form-inline" onSubmit={this._handleSubmit.bind(this)}>
        <input
          type="text"
          placeholder="username"
          id="account_username"
          name="account[username]"
          value={this.state.username}
          onChange={this._handleUsernameChange.bind(this)}
          className="form-control"
        />
        <input type="submit" className="btn btn-default" value="Search" />
      </form>
    );
  }
}
