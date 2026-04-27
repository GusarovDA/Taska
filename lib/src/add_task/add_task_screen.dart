import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constans/colors.dart';
import 'package:flutter_dev_test/constans/dimensions.dart';
import 'package:flutter_dev_test/constans/strings.dart';
import 'package:flutter_dev_test/design/images.dart';
import 'package:flutter_dev_test/models/task.dart';
import 'package:flutter_dev_test/shared/login_and_register_button.dart';
import 'package:flutter_dev_test/shared/custom_text_field.dart';
import 'package:flutter_dev_test/src/add_task/widgets/deadline_controller.dart';
import 'package:flutter_dev_test/src/add_task/widgets/priority_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerTag = TextEditingController();

  void _saveTask() {
    final String title = _controllerTitle.text;
    final String tag = _controllerTag.text;

    if (title.isNotEmpty & tag.isNotEmpty) {
      final Task newTask = Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        tag: tag,
      );

      final Box<Task> taskBox = Hive.box<Task>('tasks_box');
      taskBox.add(newTask);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _controllerTitle.dispose();
    _controllerTag.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: colorWhite,
        surfaceTintColor: colorWhite,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        toolbarHeight: screenHeight * (58 / designHeight),
        title: Padding(
          padding: EdgeInsets.only(
            top: screenHeight * (16 / designHeight),
            left: screenWidth * (24 / designWidth),
          ),
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
              SizedBox(width: screenWidth * (51 / designWidth)),

              Text(
                'Добавить задачу',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * (fontSize18 / designWidth),
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF002055),
                  letterSpacing: 0,
                  height: lineHeight18 / fontSize18,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * (24 / designWidth),
            right: screenWidth * (24 / designWidth),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * (16 / designHeight)),
              Text(
                'Наименование задачи',
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
                text: 'Введите задачу',
                controller: _controllerTitle,
                heightForm: 64,
                widthForm: 327,
              ),
              SizedBox(height: screenHeight * (16 / designHeight)),
              Text(
                'Примечание',
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
                text: 'Текст примечания',
                heightForm: 64,
                widthForm: 327,
              ),
              SizedBox(height: screenHeight * (16 / designHeight)),
              Text(
                'Выбрать тег',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * (fontSize14 / designWidth),
                  fontWeight: FontWeight.w400,
                  color: colorTextSecondaryDashboard,
                  letterSpacing: 0,
                  height: lineHeight14 / fontSize14,
                ),
              ),
              SizedBox(height: screenHeight * (16 / designHeight)),

              DropdownMenu(
                width: screenWidth * (327 / designWidth),
                controller: _controllerTag,
                trailingIcon: Image(
                  image: arrowDownImg,
                  color: colorBorderActive,
                  height: screenHeight * (24 / designHeight),
                  width: screenWidth * (24 / designWidth),
                  fit: BoxFit.scaleDown,
                ), //
                selectedTrailingIcon: Transform.flip(
                  flipY: true,
                  child: Image(
                    image: arrowDownImg,
                    color: colorBorderActive,
                    height: screenHeight * (24 / designHeight),
                    width: screenWidth * (24 / designWidth),
                    fit: BoxFit.scaleDown,
                  ),
                ),

                menuStyle: MenuStyle(
                  backgroundColor: WidgetStateProperty.all(colorWhite),
                ),
                dropdownMenuEntries: [
                  DropdownMenuEntry(
                    value: 'Без тега',
                    label: 'Без тега',
                    style: MenuItemButton.styleFrom(
                      textStyle: GoogleFonts.poppins(
                        fontSize: screenWidth * (fontSize14 / designWidth),
                        fontWeight: FontWeight.w500,
                        color: colorTextPrimary,
                        letterSpacing: 0,
                        height: lineHeight14 / fontSize14,
                      ),
                    ),
                  ),
                  DropdownMenuEntry(
                    value: 'Покупки',
                    label: 'Покупки',
                    style: MenuItemButton.styleFrom(
                      textStyle: GoogleFonts.poppins(
                        fontSize: screenWidth * (fontSize14 / designWidth),
                        fontWeight: FontWeight.w500,
                        color: colorTextPrimary,
                        letterSpacing: 0,
                        height: lineHeight14 / fontSize14,
                      ),
                    ),
                  ),
                  DropdownMenuEntry(
                    value: 'Учеба',
                    label: 'Учеба',
                    style: MenuItemButton.styleFrom(
                      textStyle: GoogleFonts.poppins(
                        fontSize: screenWidth * (fontSize14 / designWidth),
                        fontWeight: FontWeight.w500,
                        color: colorTextPrimary,
                        letterSpacing: 0,
                        height: lineHeight14 / fontSize14,
                      ),
                    ),
                  ),
                  DropdownMenuEntry(
                    value: 'Работа',
                    label: 'Работа',
                    style: MenuItemButton.styleFrom(
                      textStyle: GoogleFonts.poppins(
                        fontSize: screenWidth * (fontSize14 / designWidth),
                        fontWeight: FontWeight.w500,
                        color: colorTextPrimary,
                        letterSpacing: 0,
                        height: lineHeight14 / fontSize14,
                      ),
                    ),
                  ),
                  DropdownMenuEntry(
                    value: 'Семья',
                    label: 'Семья',
                    style: MenuItemButton.styleFrom(
                      textStyle: GoogleFonts.poppins(
                        fontSize: screenWidth * (fontSize14 / designWidth),
                        fontWeight: FontWeight.w500,
                        color: colorTextPrimary,
                        letterSpacing: 0,
                        height: lineHeight14 / fontSize14,
                      ),
                    ),
                  ),
                ],
                inputDecorationTheme: InputDecorationTheme(
                  hintStyle: GoogleFonts.poppins(
                    fontSize: screenWidth * (fontSize16 / designWidth),
                    fontWeight: FontWeight.w400,
                    color: colorTextSecondary,
                    letterSpacing: 0,
                    height:
                        lineHeight16 / fontSize16, //screenHeight * (1 / 812)
                  ),
                  labelStyle: GoogleFonts.poppins(
                    fontSize: screenWidth * (fontSize16 / designWidth),
                    fontWeight: FontWeight.w500,
                    color: colorTextPrimary,
                    letterSpacing: 0,
                    height: lineHeight16 / fontSize16,
                  ),

                  contentPadding: EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 20,
                  ),
                  constraints: BoxConstraints.tightFor(
                    height: screenHeight * (64 / designHeight),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: colorBorderNoActive,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: colorBorderActive,
                      width: 1,
                    ),
                  ),
                ),
                hintText: 'Без тега',
                enableFilter: true,
                enableSearch: true,
                requestFocusOnTap: true,
              ),
              SizedBox(height: screenHeight * (16 / designHeight)),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Дата',
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
                        text: 'Дата',
                        heightForm: 64,
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
                        text: 'Время',
                        heightForm: 64,
                        widthForm: 148,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenHeight * (16 / designHeight)),
              DeadlineController(),
              SizedBox(height: screenHeight * (16 / designHeight)),
              Text(
                'Приоритет',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * (fontSize14 / designWidth),
                  fontWeight: FontWeight.w400,
                  color: colorTextSecondaryDashboard,
                  letterSpacing: 0,
                  height: lineHeight14 / fontSize14,
                ),
              ),
              SizedBox(height: screenHeight * (16 / designHeight)),
              PriorityButton(),
              SizedBox(height: screenHeight * (30 / designHeight)),
              SafeArea(
                child: Center(
                  child: Container(
                    height: screenHeight * (48 / designHeight),
                    width: screenWidth * (218 / designWidth),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: colorAddButton.withValues(alpha: 0.25),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: LoginAndRegisterButton(
                      text: 'Добавить',
                      onPressed: () {
                        _saveTask();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
