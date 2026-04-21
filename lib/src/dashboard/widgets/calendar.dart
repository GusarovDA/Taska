import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constans/colors.dart';
import 'package:flutter_dev_test/constans/dimensions.dart';
import 'package:flutter_dev_test/constans/strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class TableBasicsExample extends StatefulWidget {
  const TableBasicsExample({super.key});

  @override
  State<TableBasicsExample> createState() => _TableBasicsExampleState();
}

class _TableBasicsExampleState extends State<TableBasicsExample> {
  // CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;
    debugPrint('$screenWidth,  $screenHeight');
    return Dialog(
      backgroundColor: colorWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.87)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TableCalendar(
            locale: 'ru_RU',
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            shouldFillViewport: false,
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerStyle: HeaderStyle(
              titleTextFormatter: (date, locale) {
                return DateFormat('LLLL', locale).format(date).capitalize();
              },
              titleTextStyle: GoogleFonts.poppins(
                fontSize: screenWidth * (fontSize15 / designWidth),
                fontWeight: FontWeight.w600,
                color: colorTextPrimarySplash,
              ),
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronIcon: Icon(Icons.arrow_back),
              rightChevronIcon: Icon(Icons.arrow_forward),
            ),

            daysOfWeekStyle: DaysOfWeekStyle(
              dowTextFormatter: (date, locale) {
                String dayName = DateFormat.E(locale).format(date);
                return dayName.toUpperCase();
              },
              weekdayStyle: GoogleFonts.poppins(
                fontSize: screenWidth * (fontSize10 / designWidth),
                fontWeight: FontWeight.w500,
                color: colorTextSecondaryDashboard,
              ),
              weekendStyle: GoogleFonts.poppins(
                fontSize: screenWidth * (fontSize10 / designWidth),
                fontWeight: FontWeight.w500,
                color: colorTextSecondaryDashboard,
              ),
            ),

            calendarStyle: CalendarStyle(
              cellAlignment: Alignment.center,
              todayDecoration: BoxDecoration(
                color: colorWhite,
                shape: BoxShape.circle,
              ),
              todayTextStyle: GoogleFonts.poppins(
                fontSize: screenWidth * (fontSize10 / designWidth),
                fontWeight: FontWeight.w500,
                color: colorTextPrimarySplash,
              ),
              selectedDecoration: BoxDecoration(
                color: colorWhite,
                shape: BoxShape.circle,
                border: Border.all(color: colorTextPrimarySplash, width: 0.8),
              ),
              selectedTextStyle: GoogleFonts.poppins(
                fontSize: screenWidth * (fontSize10 / designWidth),
                fontWeight: FontWeight.w500,
                color: colorTextPrimarySplash,
              ),
              defaultTextStyle: GoogleFonts.poppins(
                fontSize: screenWidth * (fontSize10 / designWidth),
                fontWeight: FontWeight.w500,
                color: colorTextPrimary,
              ),
              weekendTextStyle: GoogleFonts.poppins(
                fontSize: screenWidth * (fontSize10 / designWidth),
                fontWeight: FontWeight.w500,
                color: colorTextPrimary,
              ),
              outsideTextStyle: GoogleFonts.poppins(
                fontSize: screenWidth * (fontSize10 / designWidth),
                fontWeight: FontWeight.w500,
                color: colorTextSecondaryDashboard,
              ),
              disabledTextStyle: GoogleFonts.poppins(
                fontSize: screenWidth * (fontSize10 / designWidth),
                fontWeight: FontWeight.w500,
                color: colorTextSecondaryDashboard,
              ),
            ),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          SizedBox(height: screenHeight * (20 / designHeight)),
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
