import { connect } from 'react-redux';
import { logout } from '../../actions/session_action';
import Greeting from './greeting';

const mapStateToProps = ({ entities: { users }, session }) => {
  return {
    currentUser: users[session.id]
  }
}

const mapDispatchToProps = dispatch => ({
  logout: () => dispatch(logout())
})

export default connect(mapStateToProps, mapDispatchToProps)(Greeting);