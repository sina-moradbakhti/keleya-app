import 'package:flutter/material.dart';
import 'package:keleya/_constants/_colors.dart';
import 'package:keleya/_constants/_edges.dart';

class CustomCheckBox extends StatelessWidget {
  final RichText text;
  final Function(bool) onChanged;
  bool defaultValue = false;
  CustomCheckBox(
      {required this.text, this.defaultValue = false, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          overlayColor:
              MaterialStateColor.resolveWith((states) => Colors.transparent),
        ),
        onPressed: () => this.onChanged(!this.defaultValue),
        child: Container(
          child: Row(
            children: [
              Icon(
                this.defaultValue
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank_rounded,
                color:
                    this.defaultValue ? CustomColors.purple : CustomColors.grey,
                size: 30,
              ),
              CustomEdges.hSeparator,
              Container(
                constraints: BoxConstraints(
                    // This constraint just using for when the widget overflowing the mobile screen
                    maxWidth: MediaQuery.of(context).size.width -
                        (CustomEdges.rightLeftLarge.left * 2) -
                        30 -
                        CustomEdges.hSeparator.width!),
                child: this.text,
              ),
            ],
          ),
        ));
  }
}
