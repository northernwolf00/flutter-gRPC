import 'package:flutter/material.dart';

enum LogLevel { info, success, error, sent }

extension LogLevelExt on LogLevel {
  Color get color {
    switch (this) {
      case LogLevel.info:
        return Colors.white70;
      case LogLevel.success:
        return Colors.greenAccent;
      case LogLevel.error:
        return Colors.redAccent;
      case LogLevel.sent:
        return Colors.cyanAccent;
    }
  }

  String get icon {
    switch (this) {
      case LogLevel.info:
        return 'ℹ️';
      case LogLevel.success:
        return '✅';
      case LogLevel.error:
        return '❌';
      case LogLevel.sent:
        return '📤';
    }
  }
}

class LogEntry {
  final String time;
  final String message;
  final LogLevel level;

  LogEntry({required this.time, required this.message, required this.level});
}
