import 'package:keleya/_config/_config.dart';
import 'package:keleya/_constants/_font_styles.dart';
import 'package:keleya/_global/_local_cache/_local_cache_manager.dart';
import 'package:keleya/_global/_local_cache/_local_cache_model.dart';
import 'package:keleya/_global/_services/_sign-in.service.dart';
import 'package:keleya/_global/_snackbar.dart';
import 'package:keleya/signInToAccount/public_api.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:crypt/crypt.dart';
import 'package:easy_localization/easy_localization.dart';

ThunkAction signInToAccountThunkAction(
    {required String email, required String password}) {
  return (Store store) async {
    new Future(() async {
      store.dispatch(Loading(true));

      var service = SignInService();
      service.body = {
        'email': email,
        'password':
            Crypt.sha256(password, rounds: 10000, salt: InAppConfig.saltPattern)
                .hash
      };

      try {
        var response = await service.call();
        if (response.statusCode == 200) {
          MySnackBar.snack(
              message: 'sign-success'.tr(),
              messageStyle: CustomTextStyles.snackbar);
          /* Save user info in local cache */
          var newModel = new LocalCacheModel(
              uid: response.result['result']['id'],
              token: response.result['result']['token'],
              email: email,
              password: password,
              name: response.result['result']['name'],
              babyBirthDate: response.result['result']['baby_birth_date'],
              onboardingDone: response.result['result']['onboarding_done'],
              isUserLoggedIn: true);
          await LocalCacheManager.shared.setData(newModel);
          InAppConfig.fresh_jwt_token =
              LocalCacheManager.shared.getData.token ?? '';
          store.dispatch(SignInToAccountAction(true));
        } else {
          store.dispatch(Loading(false));
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
      } catch (e) {
        store.dispatch(Loading(false));
        MySnackBar.snack(
            message: 'Request timeout!',
            messageStyle: CustomTextStyles.snackbar);
      }
    });
  };
}
