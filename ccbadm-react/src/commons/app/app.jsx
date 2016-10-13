const React = require('react');
const Nav = require('./nav/nav.jsx');
const Bar = require('./bar.jsx');
const appStore = require('./app.reflux').appStore;
const ReactCSSTransitionGroup = require('react-addons-css-transition-group');
const rca = require('../rca');

if (process.browser) {
  /* eslint global-require: "off" */
  require('bootstrap/scss/bootstrap-flex.scss');
  require('designmodo-flat-ui/dist/css/flat-ui.css');
  require('font-awesome/css/font-awesome.css');
  require('animate.css/animate.min.css');
  /* eslint global-require: "always" */
}

class App extends React.Component {
  constructor() {
    super();
    this.state = appStore.getState();
  }
  componentDidMount() {
    this.unsubscribe = appStore.listen(this.afterChange.bind(this));
  }
  componentWillUnmount() {
    this.unsubscribe();
  }
  afterChange(state) {
    this.setState(state);
  }
  render() {
    return (
      <div>
        <ReactCSSTransitionGroup
          transitionName="vertical"
          transitionEnterTimeout={500}
          transitionLeaveTimeout={300}
        >
          {(this.state.menu) ? <Nav show={this.state.menu} /> : null}
        </ReactCSSTransitionGroup>
        <Bar />
        <div className="content nga-fast nga-stagger nga-squash-left">
          { this.props.children }
        </div>
      </div>
    );
  }
}

module.exports = App;
