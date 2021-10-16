import 'package:keleya/_constants/_font_styles.dart';
import 'package:keleya/_global/_snackbar.dart';
import 'package:easy_localization/easy_localization.dart';

/* Validator CLASS & FUNCTIONS */

class Validator {
  static bool email(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool validateForm(List<FormFieldObject> fields) {
    for (var field in fields) {
      bool status = true;
      switch (field.type) {
        case FormFieldObjectType.Email:
          if (field.value == null) {
            status = false;
            MySnackBar.snack(
                message: 'email-empty-msg'.tr(),
                messageStyle: CustomTextStyles.snackbar);
          } else {
            if (field.value!.isEmpty) {
              status = false;
              MySnackBar.snack(
                  message: 'email-empty-msg'.tr(),
                  messageStyle: CustomTextStyles.snackbar);
            } else if (!Validator.email(field.value!)) {
              status = false;
              MySnackBar.snack(
                  message: 'email-not-valid-msg'.tr(),
                  messageStyle: CustomTextStyles.snackbar);
            }
          }
          break;
        case FormFieldObjectType.Password:
          if (field.value == null) {
            status = false;
            MySnackBar.snack(
                message: 'passwords-empty-msg'.tr(),
                messageStyle: CustomTextStyles.snackbar);
          } else {
            if (field.value!.isEmpty) {
              status = false;
              MySnackBar.snack(
                  message: 'passwords-empty-msg'.tr(),
                  messageStyle: CustomTextStyles.snackbar);
            }
          }
          break;
      }
      if (!status) return false;
    } // for loop
    return true;
  }
}

enum FormFieldObjectType { Email, Password }

class FormFieldObject {
  FormFieldObjectType type = FormFieldObjectType.Email;
  String? value;

  FormFieldObject({required this.type, this.value});
}
