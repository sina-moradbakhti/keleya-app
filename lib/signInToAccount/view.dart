import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_redux/flutter_redux.dart';
// keleya libs
import 'package:keleya/_constants/_colors.dart';
import 'package:keleya/_constants/_edges.dart';
import 'package:keleya/_constants/_font_styles.dart';
import 'package:keleya/_custom_widgets/_button.dart';
import 'package:keleya/_custom_widgets/_textfield.dart';
import 'package:keleya/_global/_snackbar.dart';
// all needed for redux
import './public_api.dart';

class SignInToAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _initialState = AppState();
    return Scaffold(
      backgroundColor: CustomColors.purple,
      extendBody: true,
      body: StoreProvider(
          store: Store<AppState>(reducer,
              initialState: _initialState, middleware: [thunkMiddleware]),
          child: StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (context, state) => buildBody(state),
          )),
    );
  }

  Widget buildBody(AppState state) {
    return Builder(
      builder: (context) => SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: CustomEdges.title0,
                child: Text('signin-account-title'.tr(),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        CustomEdges.vSeparator6x,
                        Text(
                          'sign-in-using-keleya-info'.tr(),
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.title2(),
                        ),
                        CustomEdges.vSeparator6x,
                        CustomTextField(
                          controller: state.txtEmail,
                          hint: 'enter-your-email'.tr(),
                          label: 'your-email'.tr(),
                        ),
                        CustomEdges.vSeparator,
                        CustomTextField(
                          controller: state.txtPassword,
                          hint: 'enter-your-password'.tr(),
                          label: 'password'.tr(),
                          isPassword: true,
                          showPassword: state.showPassword,
                          onTappedShowPassword: () =>
                              StoreProvider.of<AppState>(context)
                                  .dispatch(ShowPassword(!state.showPassword)),
                        ),
                        CustomEdges.vSeparator,
                        Align(
                          child: TextButton(
                              onPressed: null,
                              child: Text(
                                'forgot-your-password'.tr(),
                                style: CustomTextStyles.checkboxLink,
                              )),
                          alignment: Alignment.centerRight,
                        )
                      ],
                    ),
                    SafeArea(
                        child: Padding(
                      padding: EdgeInsets.only(
                          bottom: CustomEdges.vSeparator2x.height!),
                      child: CustomButton(
                          isLoading: state.isLoading,
                          onPressed: () {
                            if (state.txtEmail.text.isEmpty ||
                                state.txtPassword.text.isEmpty) {
                              MySnackBar.snack(
                                  message: 'email-password-empty-msg'.tr(),
                                  messageStyle: CustomTextStyles.snackbar);
                              return;
                            }

                            StoreProvider.of<AppState>(context).dispatch(
                                signInToAccountThunkAction(
                                    email: state.txtEmail.text,
                                    password: state.txtPassword.text));
                          },
                          text: 'sign-in'.tr()),
                    )),
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
