import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constans/colors.dart';
import 'package:flutter_dev_test/constans/dimensions.dart';
import 'package:flutter_dev_test/constans/strings.dart';
import 'package:flutter_dev_test/shared/auth_redirect.dart';
import 'package:flutter_dev_test/shared/login_and_register_button.dart';
import 'package:flutter_dev_test/shared/login_and_register_text_field.dart';
import 'package:flutter_dev_test/shared/decorative_circles.dart';
import 'package:flutter_dev_test/shared/shadow_decoration.dart';
import 'package:flutter_dev_test/src/register/register_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,

        toolbarHeight: screenHeight * (58 / designHeight), // 142px
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(top: screenHeight * (28 / designHeight)),
            child: Container(
              // color: Colors.amber,
              child: Text(
                textLogin,
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * (fontSize18 / designWidth),
                  fontWeight: FontWeight.w400,
                  color: colorTextPrimary,
                  letterSpacing: 0,
                  height: lineHeight18 / fontSize18, //screenHeight * (1 / 812)
                ),
              ),
            ),
          ),
          // ),
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
                child: DecorativeCircles(colorCircleTwo: colorCircleTwoLogin),
              ),

              SizedBox(
                width: screenWidth * (248 / designWidth),
                child: Text(
                  'Добро пожаловать',
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * (fontSize25 / designWidth),
                    fontWeight: FontWeight.w600,
                    color: colorTextPrimary,
                    letterSpacing: 0,
                    height: lineHeight25 / fontSize25,
                  ),
                  textAlign: TextAlign.left,
                  // softWrap: true,
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
                  'Введите E-mail и пароль для входа',
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
                text: textEmail,
                isObscureText: false,
                isEnableSuggestions: true,
                isAutocorrect: true,
              ), // поле для ввода email
              SizedBox(
                height: screenHeight * (30 / designHeight),
                width: screenWidth,
              ),
              LoginAndRegisterTextField(
                text: textPassword,
                isObscureText: true,
                isEnableSuggestions: false,
                isAutocorrect: false,
              ), // поле для ввода пароля
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
                child: LoginAndRegisterButton(text: textLogin),
              ),
              SizedBox(
                height: screenHeight * (31 / designHeight),
                width: screenWidth,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * (37 / designWidth),
                ),
                child: AuthRedirect(
                  text: textLoginDirect,
                  screen: RegisterScreen(),
                  textButton: textLoginDirectButton,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
