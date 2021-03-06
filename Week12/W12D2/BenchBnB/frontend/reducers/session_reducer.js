import {RECEIVE_CURRENT_USER, LOGOUT_CURRENT_USER} from '../actions/session_actions';
const _nullUser = {id: null}

const sessionReducer = (state = {}, action) => {
    Object.freeze(state);
    switch(action.type) {
        case RECEIVE_CURRENT_USER:
            return Object.assign( {}, {id: action.currentUser.id})  //Not sure if this works
        case LOGOUT_CURRENT_USER:
            return _nullUser
        default:
            return state;
    }
}

export default sessionReducer;