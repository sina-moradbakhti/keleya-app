import 'package:keleya/_global/_navigator.dart';
import 'package:keleya/_global/_routes.dart';
import 'package:keleya/signInToAccount/redux/actions.dart';
import 'package:keleya/signInToAccount/redux/appState.dart';

AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);
  switch (action.runtimeType) {
    case Loading:
      newState.isLoading = action.playload;
      break;
    case ShowPassword:
      newState.showPassword = action.playload;
      break;
    case SignInToAccountAction:
      CustomNavigator.pushedTo(route: CustomRoutes.HOME);
      break;
  }
  return newState;
}
