import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';
import upTownThunk from '../middleware/thunk';

const configureStore = (preloadedState = {}) => {
  return createStore(rootReducer, preloadedState, applyMiddleware(upTownThunk));
};

export default configureStore;
