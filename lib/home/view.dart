import 'package:flutter/material.dart';
import 'package:keleya/_config/_config.dart';
import 'package:keleya/_constants/_colors.dart';
import 'package:keleya/_constants/_edges.dart';
import 'package:keleya/_constants/_font_styles.dart';
import 'package:keleya/_constants/_images.dart';
import 'package:easy_localization/easy_localization.dart';

part 'congratulation-view.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: CustomColors.white,
      body: SafeArea(
        child: congratulationView,
      ),
    );
  }
}
