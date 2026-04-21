import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constans/colors.dart';
import 'package:flutter_dev_test/constans/dimensions.dart';
import 'package:flutter_dev_test/constans/strings.dart';
import 'package:flutter_dev_test/shared/custom_checkbox.dart';
import 'package:flutter_dev_test/shared/custom_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class DeadlineController extends StatefulWidget {
  const DeadlineController({super.key});

  @override
  State<DeadlineController> createState() => _DeadlineControllerState();
}

class _DeadlineControllerState extends State<DeadlineController> {
  bool _isCheckBoxChecked = false;
  final TextEditingController _controllerDate = TextEditingController();
  final TextEditingController _controllerTime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCheckbox(
                value: _isCheckBoxChecked,
                size: 27,
                onChanged: (bool? value) {
                  setState(() {
                    _isCheckBoxChecked = value ?? false;
                    if (!_isCheckBoxChecked) {
                      _controllerDate.clear();
                      _controllerTime.clear();
                    }
                  });
                },
              ),
              SizedBox(width: screenWidth * (10 / designWidth)),
              SizedBox(
                height: screenWidth * (27 / designWidth),
                child: Center(
                  child: Text(
                    'Есть срок?',
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * (fontSize14 / designWidth),
                      fontWeight: FontWeight.w400,
                      color: colorTextSecondaryDashboard,
                      letterSpacing: 0,
                      height: lineHeight14 / fontSize14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        
        SizedBox(height: screenHeight * (16 / designHeight)),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Выполнить до',
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * (fontSize14 / designWidth),
                    fontWeight: FontWeight.w400,
                    color: colorTextSecondaryDashboard,
                    letterSpacing: 0,
                    height: lineHeight14 / fontSize14,
                  ),
                ),
                SizedBox(height: screenHeight * (16 / designHeight)),
                CustomTextField(
                  text: _isCheckBoxChecked ? 'Дата' : '',
                  controller: _controllerDate,
                  isEnabled: _isCheckBoxChecked,
                  isObscureText: false,
                  isEnableSuggestions: true,
                  isAutocorrect: true,
                  heightForm: 53,
                  widthForm: 148,
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Время',
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * (fontSize14 / designWidth),
                    fontWeight: FontWeight.w400,
                    color: colorTextSecondaryDashboard,
                    letterSpacing: 0,
                    height: lineHeight14 / fontSize14,
                  ),
                ),
                SizedBox(height: screenHeight * (16 / designHeight)),
                CustomTextField(
                  text: _isCheckBoxChecked ? 'Время' : '',
                  controller: _controllerTime,
                  isEnabled: _isCheckBoxChecked,
                  heightForm: 53,
                  widthForm: 148,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
