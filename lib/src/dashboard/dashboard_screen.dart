import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_dev_test/constans/colors.dart';
import 'package:flutter_dev_test/constans/dimensions.dart';
import 'package:flutter_dev_test/constans/strings.dart';
import 'package:flutter_dev_test/design/images.dart';
import 'package:flutter_dev_test/src/dashboard/widgets/search_bar.dart';

import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: colorWhite,
        automaticallyImplyLeading: false,
        toolbarHeight: screenHeight * (93 / designHeight),
        titleSpacing: 0,
        title: Stack(
          children: [
            Container(height: screenHeight * (93 / designHeight)),
            Positioned(
              child: ClipRect(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * (16 / designHeight),
                    left: screenWidth * (24 / designWidth),
                    right: screenWidth * (24 / designWidth),
                  ),
                  child: SizedBox(
                    height: screenHeight * (42 / designHeight),
                    width: screenWidth * (327 / designWidth),
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
                              side: BorderSide(
                                color: colorBorderNoActive,
                                width: 1,
                              ),
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
                                  image: arrowBackImg, //plusImg
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
                        Expanded(
                          child: SizedBox(),
                        ), //width: screenWidth * (66 / designWidth)
                        SizedBox(
                          width: screenWidth * (112 / designWidth),

                          child: Text(
                            textDashboard,
                            style: GoogleFonts.poppins(
                              fontSize:
                                  screenWidth * (fontSize18 / designWidth),
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF002055),
                              letterSpacing: 0,
                              height: lineHeight18 / fontSize18,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ), //width: screenWidth * (83 / designWidth)
                        SizedBox(
                          height: screenHeight * (24 / designHeight),
                          width: screenWidth * (24 / designWidth),
                          child: ElevatedButton(
                            onPressed: () {
                              //добавить ссылку на экран создания задачи
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorWhite,
                              padding: EdgeInsets.zero,
                              // foregroundColor: colorWhite,
                              // side: BorderSide(color: colorBorderNoActive, width: 1),
                              // shape: CircleBorder(),
                              elevation: 0,
                              surfaceTintColor: Colors.transparent,
                              shadowColor: Colors.transparent,

                              fixedSize: Size(
                                screenWidth * (24 / designWidth),
                                screenHeight * (24 / designHeight),
                              ),
                            ),

                            child: SizedBox(
                              height: screenHeight * (24 / designHeight),
                              width: screenWidth * (24 / designWidth),
                              child: Center(
                                child: Image(
                                  image: plusImg, //
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.center,
                                  color: Color(0xFF002055),
                                  height: screenHeight * (20 / designHeight),
                                  width: screenWidth * (20 / designWidth),
                                ),
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
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: screenWidth * (24 / designWidth)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(text: "Что надо сделать?"),
              SizedBox(height: screenHeight * (30 / designHeight)),

              Padding(
                padding: EdgeInsets.only(
                  right: screenWidth * (24 / designWidth),
                ),
                child: Stack(
                  //fdfd
                  children: [
                    SizedBox(
                      height: screenHeight * (56 / designHeight),
                      width: screenWidth * (327 / designWidth),
                      // color: colorCircleOne,
                    ),
                    // ),
                    Positioned(
                      top: screenHeight * (9 / designHeight),
                      child: ClipRect(
                        child: Container(
                          // height: screenHeight * (42 / designHeight),
                          width: screenWidth * (143 / designWidth),
                          // color: colorButton,
                          // child: Center(
                          child: Text(
                            '20 октября', //поменять чтобы отображалась текущая дата
                            style: GoogleFonts.poppins(
                              fontSize:
                                  screenWidth * (fontSize25 / designWidth),
                              fontWeight: FontWeight.w600,
                              color: colorTextPrimary,
                              letterSpacing: 0,
                              height: lineHeight25 / fontSize25,
                            ),
                          ),
                          // ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenHeight * (42 / designHeight),
                      child: ClipRect(
                        child: Container(
                          // height: screenHeight * (42 / designHeight),
                          width: screenWidth * (143 / designWidth),
                          // color: colorButton,
                          // child: Center(
                          child: Text(
                            '3 задачи на сегодня', //поменять чтобы отображалась текущее количество задач
                            style: GoogleFonts.poppins(
                              fontSize:
                                  screenWidth * (fontSize14 / designWidth),
                              fontWeight: FontWeight.w400,
                              color: colorTextSecondaryDashboard,
                              letterSpacing: 0,
                              height: lineHeight14 / fontSize14,
                            ),
                          ),
                          // ),
                        ),
                      ),
                    ),
                    Positioned(
                      // top: screenHeight * (42 / designHeight),
                      left: screenWidth * (285 / designWidth),
                      child: ClipRect(
                        child: SizedBox(
                          height: screenHeight * (42 / designHeight),
                          width: screenWidth * (42 / designWidth),
                          child: ElevatedButton(
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2030),
                                
                              )
                              ;
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorWhite,
                              padding: EdgeInsets.zero,
                              foregroundColor: colorWhite,
                              side: BorderSide(
                                color: colorBorderNoActive,
                                width: 1,
                              ),
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
                                  image: calendarImg, //иконка календарь
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.center,
                                  color: Color(0xFF002055),
                                  height: screenHeight * (20 / designHeight),
                                  width: screenWidth * (20 / designWidth),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * (30 / designHeight)),
            ],
          ),
        ),
      ),
    );
  }
}
