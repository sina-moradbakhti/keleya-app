part of 'view.dart';

Widget get congratulationView => Stack(
      fit: StackFit.expand,
      children: [
        Align(
          child: Padding(
            padding: EdgeInsets.only(bottom: (CustomEdges.vSeparator6x.height! * 2.5)),
            child: Image.asset(
              CustomImagesPath.babyMother_3x,
              alignment: Alignment.center,
              fit: BoxFit.fitWidth,
            ),
          ),
          alignment: Alignment.bottomCenter,
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                left: CustomEdges.rightLeftVeryLarge.left,
                right: CustomEdges.rightLeftVeryLarge.right,
                top: (CustomEdges.vSeparator6x.height! * 2.5)),
            child: Text(
              'congratulation'.tr(),
              textAlign: TextAlign.center,
              style: CustomTextStyles.title1_2(),
            ),
          ),
        )
      ],
    );
