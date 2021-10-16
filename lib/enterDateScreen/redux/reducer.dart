import 'package:keleya/_global/_navigator.dart';
import 'package:keleya/_global/_routes.dart';
import 'package:keleya/enterDateScreen/redux/actions.dart';
import 'package:keleya/enterDateScreen/redux/appState.dart';

AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);
  switch (action.runtimeType) {
    case UpdateSelectedDateAction:
      newState.selectedDate = action.playload;
      newState.txtBabyBirthDate.text =
          '${newState.selectedDate!.day.toString()}.${newState.selectedDate!.month.toString()}.${newState.selectedDate!.year.toString().substring(2)}';
      break;
    case GoToNextStepAction:
      CustomNavigator.pushedTo(route: CustomRoutes.HOME);
      break;
  }
  return newState;
}
