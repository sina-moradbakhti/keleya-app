import 'package:flutter/material.dart';
import 'package:keleya/_config/_config.dart';
import 'package:keleya/_global/_navigator.dart';
import 'package:keleya/_global/_routes.dart';
import 'package:keleya/_constants/_colors.dart';
import 'package:keleya/_constants/_edges.dart';
import 'package:keleya/_constants/_font_styles.dart';
import 'package:keleya/_global/_local_cache/_local_cache_manager.dart';
import 'package:keleya/createAccount/view.dart';
import 'package:keleya/enterDateScreen/view.dart';
import 'package:keleya/enterNameScreen/view.dart';
import 'package:keleya/home/view.dart';
import 'package:keleya/initialScreen/views/view.dart';
// Localization Library
import 'package:easy_localization/easy_localization.dart';
import 'package:keleya/signInToAccount/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // just for debug test (it causes every time you entered the app your session be cleared)
  // LocalCacheManager.shared.clearAllData();

  runApp(EasyLocalization(
      child: MyApp(),
      supportedLocales: InAppConfig.localizations,
      fallbackLocale: InAppConfig.localizations.first,
      path: InAppConfig.localization_path));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: LocalCacheManager.shared.loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(color: CustomColors.white);
          } else {
            if (snapshot.connectionState == ConnectionState.done) {
              return MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                navigatorKey: CustomNavigator.current,
                initialRoute: (!LocalCacheManager.shared.getData.isUserLoggedIn)
                    ? CustomRoutes.INITIAL_SCREEN
                    : this.getInAppRoute(),
                routes: {
                  CustomRoutes.INITIAL_SCREEN: (context) => InitialScreen(),
                  CustomRoutes.CREATE_ACCOUNT: (context) => CreateAccount(),
                  CustomRoutes.SIGN_IN: (context) => SignInToAccount(),
                  CustomRoutes.ENTER_NAME: (context) => EnterNameScreen(),
                  CustomRoutes.ENTER_DATE: (context) => EnterDateScreen(),
                  CustomRoutes.HOME: (context) => Home()
                },
              );
            } else {
              return Container(
                color: CustomColors.white,
                padding: CustomEdges.rightLeftSecondary,
                child: Text(
                  snapshot.error.toString(),
                  style: CustomTextStyles.error(),
                ),
              );
            }
          }
        });
  }

  String getInAppRoute() {
    if (LocalCacheManager.shared.getData.name == null)
      return CustomRoutes.ENTER_NAME;
    if (LocalCacheManager.shared.getData.babyBirthDate == null)
      return CustomRoutes.ENTER_DATE;
    return CustomRoutes.HOME;
  }
}
