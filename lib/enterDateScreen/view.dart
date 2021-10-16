import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:keleya/_global/_navigator.dart';
import 'package:keleya/_constants/_colors.dart';
import 'package:keleya/_constants/_edges.dart';
import 'package:keleya/_constants/_font_styles.dart';
import 'package:keleya/_custom_widgets/_button.dart';
import 'package:keleya/_custom_widgets/_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// all needed for redux
import './public_api.dart';

class EnterDateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    final _initialState = AppState(name: args);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: CustomEdges.rightLeftPrimary,
            child: IconButton(
                splashRadius: 25,
                onPressed: () => CustomNavigator.pop(),
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: CustomColors.purple,
                  size: 25,
                )),
          ),
        ),
        backgroundColor: CustomColors.white,
        body: StoreProvider(
            store: Store<AppState>(reducer,
                initialState: _initialState, middleware: [thunkMiddleware]),
            child: StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, state) => buildBody(state),
            )));
  }

  Widget buildBody(AppState state) {
    return Builder(
        builder: (BuildContext context) => SafeArea(
              child: Padding(
                padding: CustomEdges.rightLeftSecondary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomEdges.vSeparator6x,
                        Padding(
                          padding: CustomEdges.rightLeftVeryLarge,
                          child: Text(
                            'when-was-your-baby-born'.tr(),
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.title1_2(
                                color: CustomColors.black),
                          ),
                        ),
                        CustomEdges.vSeparator3x,
                        Text(
                          'when-was-your-baby-born-caption'.tr(),
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.caption(
                              color: CustomColors.darkGrey),
                        ),
                        CustomEdges.vSeparator6x,
                        GestureDetector(
                          child: CustomTextField(
                            controller: state.txtBabyBirthDate,
                            isDisabled: true,
                            hasLabel: false,
                            hint: 'choose-a-date'.tr(),
                          ),
                          onTap: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime.now()
                                    .add(Duration(days: -(2 * 365))),
                                maxTime: DateTime.now()
                                    .add(Duration(days: (2 * 365))),
                                onConfirm: (date) => StoreProvider.of<AppState>(
                                        context)
                                    .dispatch(UpdateSelectedDateAction(date)),
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: CustomEdges.vSeparator2x.height!),
                      child: CustomButton(
                          onPressed: () => StoreProvider.of<AppState>(context)
                              .dispatch(updateAccountThunkAction(
                                  name: state.name, date: state.selectedDate)),
                          text: 'next-question'.tr()),
                    )
                  ],
                ),
              ),
            ));
  }
}
