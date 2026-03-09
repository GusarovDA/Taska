import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constans/colors.dart';
import 'package:flutter_dev_test/constans/dimensions.dart';
import 'package:flutter_dev_test/constans/strings.dart';
import 'package:flutter_dev_test/design/images.dart';
import 'package:flutter_dev_test/shared/shadow_decoration.dart';
import 'package:flutter_dev_test/src/splash/widgets/gradient_button_splash.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;
    var bottomPading = MediaQuery.paddingOf(context).bottom;
    return Column(
      children: [
        Image(
          image: splashImg,
          width: screenWidth,
          height: screenHeight * (379 / designHeight),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),

        Expanded(
          child: Stack(
            children: [
              Container(
                width: screenWidth,
                height: screenHeight * (433 / designHeight),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [colorBlurGradientStart, colorBlurGradientEnd],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                  ),
                ),
              ),
              Positioned(
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 31,
                      sigmaY: 31,
                      tileMode: TileMode.mirror,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            colorBackgroundGradientStart,
                            colorBackgroundGradientEnd,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),

                      width: screenWidth,
                      height: screenHeight * (433 / designHeight),
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: screenHeight * (63 / designHeight),
                              width: screenWidth,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: screenWidth * (103 / designWidth),
                                right: screenWidth * (103 / designWidth),
                              ),
                              child: SizedBox(
                                // height: screenHeight * 0.059,
                                width: screenWidth * (167 / designWidth),
                                child: Text(
                                  'Taska',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.pollerOne(
                                    fontSize:
                                        screenWidth *
                                        (fontSize46 / designWidth),
                                    fontWeight: FontWeight.w400,
                                    height: lineHeight48 / fontSize46,
                                    color: colorTextPrimarySplash,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * (16 / designHeight),
                              width: screenWidth,
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                left: screenWidth * (40 / designWidth),
                                right: screenWidth * (40 / designWidth),
                              ),
                              child: SizedBox(
                                // height: screenHeight * (90/designHeight),
                                width: screenWidth * (295 / designWidth),
                                child: Text(
                                  'Персональный таск-трекер',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize:
                                        screenWidth *
                                        (fontSize37 / designWidth),
                                    fontWeight: FontWeight.w700,
                                    color: colorTextSecondarySplash,
                                    letterSpacing:
                                        -0.8 * (screenWidth / designWidth),
                                    height:
                                        lineHeight45 /
                                        fontSize37, //  screenHeight * 0.0014
                                  ),
                                ),
                              ),
                            ),
                            // ),
                            SizedBox(
                              height: screenHeight * (10 / screenHeight),
                              width: screenWidth,
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                left: screenWidth * (40 / designWidth),
                                right: screenWidth * (40 / designWidth),
                              ),
                              child: SizedBox(
                                // height: screenHeight * 0.03,
                                width: screenWidth * (295 / designWidth),
                                child: Text(
                                  'Порядок в делах – порядок в уме',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize:
                                        screenWidth *
                                        (fontSize14 / designWidth),
                                    fontWeight: FontWeight.w700,
                                    color: colorTextTertiarySplash.withValues(
                                      alpha: opacity60,
                                    ),
                                    letterSpacing: 0,
                                    height:
                                        lineHeight24 /
                                        fontSize14, //screenHeight * 0.002
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: screenHeight * (66 / designHeight),
                              width: screenWidth,
                            ),

                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: screenWidth * (40 / designWidth),
                                  right: screenWidth * (40 / designWidth),
                                  bottom: bottomPading,
                                ),
                                child: Container(
                                  decoration: shadowDecoration(
                                    context: context,
                                    designHeight: designHeight,
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      return GradientButtonSplash();
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
