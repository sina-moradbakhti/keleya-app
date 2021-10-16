import 'package:keleya/_config/_config.dart';
import 'package:keleya/_constants/_font_styles.dart';
import 'package:keleya/_global/_local_cache/_local_cache_manager.dart';
import 'package:keleya/_global/_local_cache/_local_cache_model.dart';
import 'package:keleya/_global/_services/_refresh-token.service.dart';
import 'package:keleya/_global/_services/_update-account.service.dart';
import 'package:keleya/_global/_snackbar.dart';
import 'package:keleya/createAccount/public_api.dart';
import 'package:keleya/enterDateScreen/redux/actions.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction updateAccountThunkAction({required String name, DateTime? date}) {
  String strDate =
      '${date!.day.toString()}.${date.month.toString()}.${date.year.toString().substring(2)}';
  return (Store store) async {
    new Future(() async {
      await LocalCacheManager.shared.loadData();
      var service = UpdateAccountService();
      service.body = {
        'email': LocalCacheManager.shared.getData.email,
        'id': LocalCacheManager.shared.getData.uid,
        'name': name,
        'baby_birth_date': strDate,
        'onboarding_done': '1'
      };
      service.headers =
          service.makeAuthHeader(LocalCacheManager.shared.getData.token!);
      var response = await service.call();

      if (response.statusCode == 401) {
        // token expired > refresh token
        final refreshTokenService = new RefreshTokenService();
        var refreshedResponse = await refreshTokenService.call();
        if (refreshedResponse.statusCode == 200) {
          _update(response, name, strDate, store);
        } else {
          MySnackBar.snack(
              message: 'Unknown Token error!',
              messageStyle: CustomTextStyles.snackbar);
        }
      } else {
        _update(response, name, strDate, store);
      }
    });
  };
}

void _update(response, name, strDate, store) async {
  if (response.statusCode == 200) {
    /* Update user info in local cache */
    LocalCacheModel newModel = LocalCacheManager.shared.getData;
    newModel.token = response.result['result']['token'];
    newModel.name = name;
    newModel.babyBirthDate = strDate;
    newModel.onboardingDone = true;

    await LocalCacheManager.shared.setData(newModel);
    InAppConfig.fresh_jwt_token = newModel.token!;
    store.dispatch(GoToNextStepAction());
  } else {
    if (response.result['message'] != null) {
      MySnackBar.snack(
          message: response.result['message'],
          messageStyle: CustomTextStyles.snackbar);
    } else {
      MySnackBar.snack(
          message: 'Unknown server error!',
          messageStyle: CustomTextStyles.snackbar);
    }
  }
}
