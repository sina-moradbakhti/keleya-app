import 'package:flutter/material.dart';
import 'package:keleya/_constants/_colors.dart';
import 'package:keleya/_constants/_edges.dart';
import 'package:keleya/_constants/_font_styles.dart';
import 'package:keleya/_custom_widgets/_loadings.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  bool isPrimary = true;
  bool isDisabled = false;
  bool isLoading = false;
  CustomButton(
      {required this.text,
      this.isLoading = false,
      required this.onPressed,
      this.isPrimary = true,
      this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    if (this.isPrimary) {
      return Opacity(
        opacity: this.isDisabled ? 0.5 : 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: TextButton(
            onPressed:
                (this.isDisabled || this.isLoading) ? null : this.onPressed,
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(CustomColors.purple),
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero)),
            child: Container(
              padding: CustomEdges.medium,
              child: !this.isLoading
                  ? Text(this.text,
                      style: CustomTextStyles.button(color: CustomColors.white))
                  : MyLoadings.ballPalse(color: CustomColors.white, size: 22),
            ),
          ),
        ),
      );
    } else {
      return Opacity(
        opacity: this.isDisabled ? 0.5 : 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: TextButton(
            onPressed:
                (this.isDisabled || this.isLoading) ? null : this.onPressed,
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(CustomColors.lightGrey),
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero)),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              padding: CustomEdges.medium,
              child: !this.isLoading
                  ? Text(this.text,
                      style:
                          CustomTextStyles.button(color: CustomColors.purple))
                  : MyLoadings.ballPalse(color: CustomColors.purple, size: 22),
            ),
          ),
        ),
      );
    }
  }
}
