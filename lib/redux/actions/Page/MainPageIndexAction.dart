import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:redux/redux.dart';

enum MainPageIndexActions { SET_INDEX }

//object
class SetIndexObject {
  MainPageIndexActions type;
  int index;

  SetIndexObject(this.index, this.type);
}

//types functions

SetIndexObject SetIndex(int index) {
  var obj = SetIndexObject(index, MainPageIndexActions.SET_INDEX);
  return obj;
}

//actions
dynamic SetCurrentIndex(int index) {
  return (Store<AppReducerState> state) {
    print(index);
    state.dispatch(SetIndex(index));
  };
}
