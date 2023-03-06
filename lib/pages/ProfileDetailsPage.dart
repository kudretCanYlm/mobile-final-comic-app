import 'package:comic_mobile_app/models/Login/ProfileDetailsModel.dart';
import 'package:comic_mobile_app/pages/MainPage/MainPage.dart';
import 'package:comic_mobile_app/redux/actions/Auth/ProfileDetailsAction.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:comic_mobile_app/utils/validators/InputValidator.dart';
import 'package:comic_mobile_app/widgets/buttons/TextButtonTypeA.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/inputs/textboxes/InputTextBox.dart';
import 'package:comic_mobile_app/widgets/inputs/upload/ImageUpload.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ProfileDetailsPage extends StatefulWidget {
  final Store<AppReducerState> store;

  ProfileDetailsPage(this.store);

  @override
  State<StatefulWidget> createState() => _ProfileDetailsPage();
}

class _ProfileDetailsPage extends State<ProfileDetailsPage>
    with TickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();

  bool allowNatifications = false;
  bool agreeTerms = false;
  bool sendEmail = false;
  bool iscontinueButtonActive = false;
  Color buttonBackgroundColorA = COLOR_D_LIGHT_3;
  Color buttonBackgroundColorB = COLOR_E_HEAVY_2;

  late Animation<Color?> colorAnimationButtonBackgroundColor;
  late AnimationController animationController;

  var profileDetailsModel = ProfileDetailsModel("", "", "", "");

  @override
  void initState() {
    profileDetailsModel.setImage("");

    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // color tween
    colorAnimationButtonBackgroundColor =
        ColorTween(begin: buttonBackgroundColorA, end: buttonBackgroundColorB)
            .animate(animationController);
  }

  void continueButtonControl() {
    setState(() {
      if (allowNatifications && agreeTerms && sendEmail) {
        animateColor();
        iscontinueButtonActive = true;
        buttonBackgroundColorA = COLOR_E_HEAVY;
      } else {
        animateColorReverse();
        iscontinueButtonActive = false;
        buttonBackgroundColorA = COLOR_D_LIGHT_3;
      }
    });
  }

  void animateColor() {
    animationController.forward();
  }

  void animateColorReverse() {
    animationController.reverse();
  }

  void readImage(String base64) {
    setState(() {
      profileDetailsModel.base64Image = base64;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(
            left: MAR_PAD_5,
            right: MAR_PAD_5,
            top: MediaQuery.of(context).viewPadding.top + MAR_PAD_1,
            bottom: MAR_PAD_5),
        decoration: BoxDecoration(
          color: COLOR_E_HEAVY_2,
          image: DecorationImage(
            image: AssetImage(
                "lib/assets/bg-images/Mountain_Range_Background.jpg"),
            fit: BoxFit.none,
            scale: 1,
            colorFilter: ColorFilter.mode(COLOR_D_HEAVY, BlendMode.color),
            opacity: 0.35,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: MAR_PAD_4,
                  ),
                  child: ImageUpload(
                    readImage,
                    size: 110,
                    iconBackgroundColor: COLOR_D_LIGHT_4,
                  ),
                ),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        InputTextBox(
                          "Enter your name",
                          (string) {
                            setState(() {
                              profileDetailsModel.RealName = string;
                            });
                          },
                          (value) => LengthValidator(value, 2, 50),
                          hintColor: COLOR_E_HEAVY,
                          inputcolor: COLOR_E_HEAVY,
                          borderColor: COLOR_E_HEAVY,
                          fontSize: FONT_SIZE_6,
                          marginVertical: MAR_PAD_0,
                          obscureText: false,
                          contentPadding: MAR_PAD_1,
                        ),
                        InputTextBox(
                          "Enter your nickname",
                          (string) {
                            setState(() {
                              profileDetailsModel.NickName = string;
                            });
                          },
                          (value) => LengthValidator(value, 5, 50),
                          hintColor: COLOR_E_HEAVY,
                          inputcolor: COLOR_E_HEAVY,
                          borderColor: COLOR_E_HEAVY,
                          fontSize: FONT_SIZE_6,
                          marginVertical: MAR_PAD_0,
                          obscureText: false,
                          contentPadding: MAR_PAD_1,
                        ),
                        InputTextBox(
                          "Write your phone",
                          (string) {
                            setState(() {
                              profileDetailsModel.Phone = string;
                            });
                          },
                          (value) => PhoneValidador(value),
                          hintColor: COLOR_E_HEAVY,
                          inputcolor: COLOR_E_HEAVY,
                          borderColor: COLOR_E_HEAVY,
                          fontSize: FONT_SIZE_6,
                          marginVertical: MAR_PAD_0,
                          obscureText: false,
                          contentPadding: MAR_PAD_1,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: COLOR_D_HEAVY_V50,
                              borderRadius: BorderRadius.circular(MAR_PAD_3)),
                          padding: EdgeInsets.all(MAR_PAD_1),
                          margin: EdgeInsets.only(top: MAR_PAD_4),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TitleTypeA(
                                    "Allow Notifications",
                                    color: COLOR_E_HEAVY_2,
                                    fontWeight: FONT_WEIGHT_4,
                                    fontSize: FONT_SIZE_6,
                                  ),
                                  Switch(
                                    value: allowNatifications,
                                    activeTrackColor: COLOR_F_HEAVY,
                                    activeColor: COLOR_E_HEAVY_2,
                                    inactiveThumbColor: COLOR_D_LIGHT_3,
                                    inactiveTrackColor: COLOR_D_LIGHT_2,
                                    onChanged: (bool value) {
                                      setState(() {
                                        allowNatifications = value;
                                      });
                                      continueButtonControl();
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TitleTypeA(
                                    "Agree Terms",
                                    color: COLOR_E_HEAVY_2,
                                    fontWeight: FONT_WEIGHT_4,
                                    fontSize: FONT_SIZE_6,
                                  ),
                                  Switch(
                                    value: agreeTerms,
                                    activeTrackColor: COLOR_F_HEAVY,
                                    activeColor: COLOR_E_HEAVY_2,
                                    inactiveThumbColor: COLOR_D_LIGHT_3,
                                    inactiveTrackColor: COLOR_D_LIGHT_2,
                                    onChanged: (bool value) {
                                      setState(() {
                                        agreeTerms = value;
                                      });
                                      continueButtonControl();
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TitleTypeA(
                                    "Send Email",
                                    color: COLOR_E_HEAVY_2,
                                    fontWeight: FONT_WEIGHT_4,
                                    fontSize: FONT_SIZE_6,
                                  ),
                                  Switch(
                                    value: sendEmail,
                                    activeTrackColor: COLOR_F_HEAVY,
                                    activeColor: COLOR_E_HEAVY_2,
                                    inactiveThumbColor: COLOR_D_LIGHT_3,
                                    inactiveTrackColor: COLOR_D_LIGHT_2,
                                    onChanged: (bool value) {
                                      setState(() {
                                        sendEmail = value;
                                      });
                                      continueButtonControl();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
            AnimatedBuilder(
                animation: colorAnimationButtonBackgroundColor,
                builder: (BuildContext _, Widget? __) {
                  return Container(
                    height: 50,
                    child: TextButtonTypeA(
                      "Continue",
                      () {
                        if (formKey.currentState!.validate() &&
                            iscontinueButtonActive) {
                          widget.store.dispatch(
                              PostProfileDetails(context, profileDetailsModel));
                        }
                      },
                      borderRadius: BORDER_RADIUS_11,
                      backgroundColor:
                          colorAnimationButtonBackgroundColor.value!,
                      textColor: COLOR_D_HEAVY,
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
