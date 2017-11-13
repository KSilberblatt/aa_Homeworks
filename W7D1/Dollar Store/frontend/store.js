import {createStore} from 'redux';
import reducer from './reducer';

let store = createStore(reducer);

module.exports = store;