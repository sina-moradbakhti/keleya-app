import 'package:flutter/material.dart';
import 'package:keleya/_global/_navigator.dart';
import 'package:keleya/_global/_routes.dart';
import 'package:keleya/_constants/_colors.dart';
import 'package:keleya/_constants/_edges.dart';
import 'package:keleya/_constants/_font_styles.dart';
import 'package:keleya/_custom_widgets/_button.dart';

import 'package:easy_localization/easy_localization.dart';

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.purple,
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: CustomEdges.title0,
                child: Text('initial-screen-title'.tr(),
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.title(color: CustomColors.white)),
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: CustomColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding: CustomEdges.rightLeftSecondary,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomButton(
                        onPressed: () => CustomNavigator.pushedTo(
                            route: CustomRoutes.SIGN_IN),
                        text: 'initial-screen-btn-sign'.tr()),
                    SizedBox(height: 50),
                    CustomButton(
                        isPrimary: false,
                        onPressed: () => CustomNavigator.pushedTo(
                            route: CustomRoutes.CREATE_ACCOUNT),
                        text: 'initial-screen-btn-create'.tr()),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
