import { connect } from 'react-redux';
import { logout } from '../../actions/session_actions';
import Greeting from './greeting';

const mapStateToProps = ({ session, entitites: { users } }) => {
  return {
    currentUser: users[sesssion.id]
  }
}

const mapDispatchToProps = dispatch => ({
  logout: () => dispatch(logout())
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Greeting);