import 'package:keleya/_constants/_font_styles.dart';
import 'package:keleya/_global/_navigator.dart';
import 'package:keleya/_global/_routes.dart';
import 'package:keleya/_global/_snackbar.dart';
import 'package:keleya/enterNameScreen/redux/actions.dart';
import 'package:keleya/enterNameScreen/redux/appState.dart';
import 'package:easy_localization/easy_localization.dart';

AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);
  switch (action.runtimeType) {
    case GoToNextStepAction:
      String name = action.playload;
      if (name.isEmpty) {
        MySnackBar.snack(
            message: 'name-empty-msg'.tr(),
            messageStyle: CustomTextStyles.snackbar);
      } else {
        CustomNavigator.pushedTo(route: CustomRoutes.ENTER_DATE, args: name);
      }
      break;
  }
  return newState;
}
