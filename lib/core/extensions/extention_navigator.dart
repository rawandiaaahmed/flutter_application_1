import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();

  void popUntil({required RoutePredicate predicate}) {
    return Navigator.of(this).popUntil(predicate);
  }
}

extension Space on num {
  SizedBox get margin => SizedBox(height: toDouble(), width: toDouble());

  String get toCompactNumber {
    if (this < 1000) {
      return toString();
    }

    return '${(this / 1000).toStringAsFixed(0)}K';
  }

  String get withLeadingZero {
    if (this < 0) {
      return '';
    }

    if (this < 10) {
      return '0$this';
    }

    return '$this';
  }
}

extension FileExtension on File {
  bool get isImageFile {
    String filePath = path;
    if (!filePath.contains('.')) {
      return false;
    }
    String extension = filePath.split('.').last.toLowerCase();
    return extension == 'jpg' || extension == 'jpeg' || extension == 'png';
  }
}

extension StringParsing on String {
  int toInt() => int.tryParse(this) ?? 0;
}

extension CrossAxisCount on double {
  int calculateCrossAxisCount() {
    if (this > 1200) {
      return 5;
    } else if (this > 600) {
      return 3;
    } else {
      return 2;
    }
  }
}

extension DateTimeFormatting on DateTime {
  String formatTime() {
    final hour = this.hour % 12 == 0 ? 12 : this.hour % 12;
    // final hour = this.hour > 12 ? this.hour - 12 : this.hour;
    final amPm = this.hour < 12 ? 'AM' : 'PM';
    return "$hour:${minute.toString().padLeft(2, '0')} $amPm";
  }

  String formatDate() {
    return "$day ${monthName(month)} $year";
  }

  String monthName(int m) {
    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[m];
  }

  String get fullMonthName {
    final List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  List<DateTime> get daysInMonth {
    final firstDay = DateTime(year, month, 1);
    final lastDay = DateTime(year, month + 1, 0);

    List<DateTime> days = [];

    // Add empty spaces for days before the first day of the month
    int startWeekday = firstDay.weekday;
    for (int i = 1; i < startWeekday; i++) {
      days.add(DateTime(0));
    }

    // Add all days of the month
    for (int day = 1; day <= lastDay.day; day++) {
      days.add(DateTime(year, month, day));
    }

    return days;
  }

  bool isSameDay(DateTime date) =>
      year == date.year && month == date.month && day == date.day;
}

extension AssetLoaderExtension on String {
  Future<Uint8List> loadAssetAsUint8List() async {
    final ByteData data = await rootBundle.load(this);
    return data.buffer.asUint8List();
  }
}

extension FormatWithNewlines on String {
  String formatWithFirstAndRest() {
    final words = trim().split(RegExp(r'\s+'));
    if (words.isEmpty) return this;

    final buffer = StringBuffer();

    buffer.writeln(words.first);

    for (var i = 1; i < words.length; i += 3) {
      final end = (i + 3 < words.length) ? i + 3 : words.length;
      buffer.writeln(words.sublist(i, end).join(' '));
    }

    return buffer.toString().trim();
  }
}
