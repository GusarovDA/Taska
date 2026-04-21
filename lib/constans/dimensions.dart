

import 'package:intl/intl.dart';

final designWidth = 375;
final designHeight = 812;

final today = DateTime.now();
final kFirstDay = DateTime(today.year, today.month - 3, today.day);
final kLastDay = DateTime(today.year, today.month + 3, today.day);
final String todayFormat = DateFormat('d MMMM', 'ru_RU').format(today);

