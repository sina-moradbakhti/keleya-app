import 'package:keleya/_global/_navigator.dart';
import 'package:keleya/_global/_routes.dart';
import 'package:keleya/createAccount/redux/actions.dart';
import 'package:keleya/createAccount/redux/appState.dart';

AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);
  switch (action.runtimeType) {
    case CheckPrivacyPolicyAction:
      newState.privacyPolicyChecked = action.playload;
      break;
    case CheckTermsConditionsAction:
      newState.termsConditionChecked = action.playload;
      break;
    case Loading:
      newState.isLoading = action.playload;
      break;
    case ShowPassword:
      newState.showPassword = action.playload;
      break;
    case ShowPasswordRepeat:
      newState.showPasswordRepeat = action.playload;
      break;
    case CreateAnAccountAction:
      CustomNavigator.pushedTo(route: CustomRoutes.ENTER_NAME);
      break;
  }
  return newState;
}
