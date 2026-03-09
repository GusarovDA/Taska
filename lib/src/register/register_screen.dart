import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constans/colors.dart';
import 'package:flutter_dev_test/constans/dimensions.dart';
import 'package:flutter_dev_test/constans/strings.dart';
import 'package:flutter_dev_test/design/images.dart';
import 'package:flutter_dev_test/shared/auth_redirect.dart';
import 'package:flutter_dev_test/shared/login_and_register_button.dart';
import 'package:flutter_dev_test/shared/login_and_register_text_field.dart';
import 'package:flutter_dev_test/shared/decorative_circles.dart';
import 'package:flutter_dev_test/shared/shadow_decoration.dart';
import 'package:flutter_dev_test/src/login/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        
        automaticallyImplyLeading: false,
        toolbarHeight: screenHeight * (58 / designHeight),
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.only(
            top: screenHeight * (16 / designHeight),
            left: screenWidth * (24 / designWidth),
          ),
          child: SizedBox(
            // color: Colors.amber,
            height: screenHeight * (42 / designHeight),
            width: screenWidth * (220 / designWidth),
            child: Row(
              
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * (42 / designHeight),
                  width: screenWidth * (42 / designWidth),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorWhite,
                      padding: EdgeInsets.zero,
                      foregroundColor: colorWhite,
                      side: BorderSide(color: colorBorderNoActive, width: 1),
                      shape: CircleBorder(),
                      elevation: 0,
                      surfaceTintColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      
                      fixedSize: Size(
                        screenWidth * (42 / designWidth),
                        screenHeight * (42 / designHeight),
                      ),
                    ),

                    child: SizedBox(
                      height: screenHeight * (42 / designHeight),
                      width: screenWidth * (42 / designWidth),
                      child: Center(
                        child: Image(
                          image: arrowBackImg,
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.center,
                          color: Color(0xFF002055),
                          height: screenHeight * (16 / designHeight),
                          width: screenWidth * (16 / designWidth),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * (66 / designWidth)),
                SizedBox(
                  width: screenWidth * (112 / designWidth),

                  child: Text(
                    textRegister,
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * (fontSize18 / designWidth),
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF002055),
                      letterSpacing: 0,
                      height:
                          lineHeight18 / fontSize18, //screenHeight * (1 / 812)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        backgroundColor: colorWhite,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: screenWidth * (24 / designWidth)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * ((287 - 24) / designWidth),
                ),
                child: DecorativeCircles(colorCircleTwo: colorCircleTwoRegister),
              ),

              SizedBox(
                width: screenWidth * (218 / designWidth),
                child: Text(
                  'Создать аккаунт',
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * (fontSize25 / designWidth), //
                    fontWeight: FontWeight.w600,
                    color: colorTextPrimary,
                    letterSpacing: 0,
                    height:
                        lineHeight25 / fontSize25, //screenHeight * (1 / 812)
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: screenHeight * (12 / designHeight),
                width: screenWidth,
              ),
              SizedBox(
                // height: screenHeight * (24 / 812),
                width: screenWidth * (249 / designWidth),
                child: Text(
                  'Заполните поля для регистрации',
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * (fontSize14 / designWidth),
                    fontWeight: FontWeight.w400,
                    color: colorTextSecondary,
                    letterSpacing: 0,
                    height:
                        lineHeight24 /
                        fontSize14, //screenHeight * ((24 / 14) / 812)
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * (64 / designHeight),
                width: screenWidth,
              ),
              LoginAndRegisterTextField(
                text: textName,
                isObscureText: false,
                isEnableSuggestions: true,
                isAutocorrect: true,
              ),
              SizedBox(
                height: screenHeight * (30 / designHeight),
                width: screenWidth,
              ),
              LoginAndRegisterTextField(
                text: textEmail,
                isObscureText: false,
                isEnableSuggestions: true,
                isAutocorrect: true,
              ),
              SizedBox(
                height: screenHeight * (30 / designHeight),
                width: screenWidth,
              ),
              LoginAndRegisterTextField(
                text: textPassword,
                isObscureText: true,
                isEnableSuggestions: false,
                isAutocorrect: false,
              ),
              SizedBox(
                height: screenHeight * (28 / designHeight),
                width: screenWidth,
              ),
              Container(
                height: screenHeight * (48 / designHeight),
                width: screenWidth * (327 / designWidth),
                decoration: shadowDecoration(
                  context: context,
                  designHeight: designHeight,
                ),
                child: LoginAndRegisterButton(text: textRegister),
              ),
              SizedBox(height: 31, width: screenWidth),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * (37 / designWidth),
                ),
                child: AuthRedirect(
                  text: textRegisterDirect,
                  screen: LoginScreen(),
                  textButton: textRegisterDirectButton,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
