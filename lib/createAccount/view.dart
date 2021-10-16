import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:keleya/_global/_functions.dart';
// keleya libs
import 'package:keleya/_global/_navigator.dart';
import 'package:keleya/_global/_routes.dart';
import 'package:keleya/_constants/_colors.dart';
import 'package:keleya/_constants/_edges.dart';
import 'package:keleya/_constants/_font_styles.dart';
import 'package:keleya/_custom_widgets/_button.dart';
import 'package:keleya/_custom_widgets/_checkbox.dart';
import 'package:keleya/_custom_widgets/_textfield.dart';
import 'package:keleya/_global/_snackbar.dart';
// all needed for redux
import './public_api.dart';

class CreateAccount extends StatelessWidget {
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
                      child: Text('create-account-title'.tr(),
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.title(
                              color: CustomColors.white)),
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
                      child: ListView(
                        physics: ClampingScrollPhysics(),
                        children: [
                          CustomEdges.vSeparator6x,
                          Text(
                            'create-an-account'.tr(),
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.title2(),
                          ),
                          CustomEdges.vSeparator3x,
                          CustomTextField(
                            hint: 'enter-your-email'.tr(),
                            label: 'your-email'.tr(),
                            controller: state.txtEmail,
                          ),
                          CustomEdges.vSeparator,
                          CustomTextField(
                            hint: 'enter-your-password'.tr(),
                            label: 'password'.tr(),
                            controller: state.txtPassword,
                            isPassword: true,
                            showPassword: state.showPassword,
                            onTappedShowPassword: () =>
                                StoreProvider.of<AppState>(context).dispatch(
                                    ShowPassword(!state.showPassword)),
                          ),
                          CustomEdges.vSeparator,
                          CustomTextField(
                            hint: 'enter-your-password-again'.tr(),
                            label: 'password'.tr(),
                            isPassword: true,
                            controller: state.txtPasswordRepeat,
                            showPassword: state.showPasswordRepeat,
                            onTappedShowPassword: () =>
                                StoreProvider.of<AppState>(context).dispatch(
                                    ShowPasswordRepeat(
                                        !state.showPasswordRepeat)),
                          ),
                          CustomEdges.vSeparator2x,
                          CustomButton(
                              isLoading: state.isLoading,
                              isDisabled: (!state.privacyPolicyChecked ||
                                  !state.termsConditionChecked),
                              onPressed: () {
                                if (Validator.validateForm([
                                  FormFieldObject(
                                      type: FormFieldObjectType.Email,
                                      value: state.txtEmail.text),
                                  FormFieldObject(
                                      type: FormFieldObjectType.Password,
                                      value: state.txtPassword.text),
                                  FormFieldObject(
                                      type: FormFieldObjectType.Password,
                                      value: state.txtPasswordRepeat.text)
                                ])) {
                                  if (state.txtPassword.text ==
                                      state.txtPasswordRepeat.text) {
                                    StoreProvider.of<AppState>(context)
                                        .dispatch(createAccountThunkAction(
                                            email: state.txtEmail.text,
                                            password: state.txtPassword.text));
                                  } else {
                                    MySnackBar.snack(
                                        message:
                                            'passwords-not-matched-msg'.tr(),
                                        messageStyle:
                                            CustomTextStyles.snackbar);
                                  }
                                }
                              },
                              text: 'create-an-account'.tr()),
                          CustomEdges.vSeparator2x,
                          CustomCheckBox(
                              defaultValue: state.privacyPolicyChecked,
                              onChanged: (ppStatus) {
                                if (Validator.validateForm([
                                  FormFieldObject(
                                      type: FormFieldObjectType.Email,
                                      value: state.txtEmail.text),
                                  FormFieldObject(
                                      type: FormFieldObjectType.Password,
                                      value: state.txtPassword.text),
                                  FormFieldObject(
                                      type: FormFieldObjectType.Password,
                                      value: state.txtPasswordRepeat.text)
                                ])) {
                                  StoreProvider.of<AppState>(context).dispatch(
                                      CheckPrivacyPolicyAction(ppStatus));
                                }
                              },
                              text: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: 'i-accept-the'.tr(),
                                      style: CustomTextStyles.checkbox),
                                  TextSpan(
                                      text: ' ' + 'privacy-policy'.tr(),
                                      recognizer: new TapGestureRecognizer()
                                        ..onTap = () => print('Tapped'),
                                      style: CustomTextStyles.checkboxLink)
                                ]),
                              )),
                          CustomCheckBox(
                              defaultValue: state.termsConditionChecked,
                              onChanged: (tcStatus) {
                                if (Validator.validateForm([
                                  FormFieldObject(
                                      type: FormFieldObjectType.Email,
                                      value: state.txtEmail.text),
                                  FormFieldObject(
                                      type: FormFieldObjectType.Password,
                                      value: state.txtPassword.text),
                                  FormFieldObject(
                                      type: FormFieldObjectType.Password,
                                      value: state.txtPasswordRepeat.text)
                                ])) {
                                  StoreProvider.of<AppState>(context).dispatch(
                                      CheckTermsConditionsAction(tcStatus));
                                }
                              },
                              text: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: 'i-accept-the'.tr(),
                                      style: CustomTextStyles.checkbox),
                                  TextSpan(
                                      text: ' ' +
                                          'terms-conditions'.tr() +
                                          ' ' +
                                          'amper-sign'.tr() +
                                          ' ' +
                                          'keleya-advice'.tr(),
                                      recognizer: new TapGestureRecognizer()
                                        ..onTap = () => print('Tapped'),
                                      style: CustomTextStyles.checkboxLink)
                                ]),
                              )),
                          CustomEdges.vSeparator2x,
                          Center(
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: 'already-have-an-account'.tr(),
                                  style: CustomTextStyles.title3()),
                              TextSpan(
                                text: ' ' + 'sign-in'.tr(),
                                style: CustomTextStyles.title3(
                                    color: CustomColors.purple),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () => CustomNavigator.pushedTo(
                                      route: CustomRoutes.SIGN_IN),
                              )
                            ])),
                          )
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            ));
  }
}
