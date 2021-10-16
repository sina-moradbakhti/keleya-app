import 'package:flutter/material.dart';
import 'package:keleya/_constants/_colors.dart';
import 'package:keleya/_constants/_edges.dart';
import 'package:keleya/_constants/_font_styles.dart';

class CustomTextField extends StatelessWidget {
  bool isDisabled = false;
  bool hasLabel = true;
  String? label;
  String? hint;
  String? value;
  bool isPassword = false;
  bool? showPassword = false;
  VoidCallback? onTappedShowPassword;
  TextEditingController? controller;
  CustomTextField(
      {this.controller,
      this.isDisabled = false,
      this.hint,
      this.label,
      this.value,
      this.hasLabel = true,
      this.isPassword = false,
      this.showPassword = false,
      this.onTappedShowPassword});

  @override
  Widget build(BuildContext context) {
    return this.hasLabel
        ? Stack(
            children: [
              Container(
                padding: CustomEdges.textfield,
                decoration: BoxDecoration(
                    border: Border.all(color: CustomColors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(8)),
                child: TextField(
                  enabled: !this.isDisabled,
                  controller: this.controller,
                  style: CustomTextStyles.textfield,
                  obscureText: this.isPassword && !this.showPassword!,
                  decoration: InputDecoration(
                      hintStyle: CustomTextStyles.textfieldHint,
                      border: InputBorder.none,
                      hintText: this.hint ?? ''),
                ),
              ),
              Positioned(
                child: Text(
                  this.label ?? '',
                  style: CustomTextStyles.textfieldLabel,
                ),
                left: CustomEdges.textfield.left,
                top: 10,
              ),
              (this.isPassword)
                  ? Positioned(
                      child: GestureDetector(
                        onTap: () => (this.onTappedShowPassword != null)
                            ? this.onTappedShowPassword!()
                            : null,
                        child: Container(
                          height: 70,
                          width: 70,
                          child: Icon(
                            Icons.remove_red_eye_rounded,
                            color: this.showPassword!
                                ? Colors.black
                                : CustomColors.grey,
                          ),
                        ),
                      ),
                      right: 0,
                      bottom: 0,
                    )
                  : Container()
            ],
          )
        : Container(
            padding: CustomEdges.textfieldNoLabel,
            decoration: BoxDecoration(
                border: Border.all(color: CustomColors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(8)),
            child: TextField(
              enabled: !this.isDisabled,
              controller: this.controller,
              style: CustomTextStyles.textfield,
              obscureText: this.isPassword,
              decoration: InputDecoration(
                  hintStyle: CustomTextStyles.textfieldHint,
                  border: InputBorder.none,
                  hintText: this.hint ?? ''),
            ),
          );
  }
}
