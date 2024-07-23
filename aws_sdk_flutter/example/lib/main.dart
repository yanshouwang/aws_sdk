import 'dart:async';
import 'dart:developer';

import 'package:clover/clover.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'view_models.dart';
import 'views.dart';

void main() {
  Logger.root.onRecord.listen(onLogRecord);
  runZonedGuarded(onStartUp, onUnhandledError);
}

void onLogRecord(LogRecord record) {
  log(
    record.message,
    time: record.time,
    sequenceNumber: record.sequenceNumber,
    level: record.level.value,
    name: record.loggerName,
    zone: record.zone,
    error: record.error,
    stackTrace: record.stackTrace,
  );
}

void onStartUp() {
  final app = MaterialApp(
    home: ViewModelBinding(
      viewBuilder: (context) => const PutObjectView(),
      viewModelBuilder: (context) => PutObjectViewModel(),
    ),
  );
  runApp(app);
}

void onUnhandledError(Object error, StackTrace stackTrace) {
  Logger.root.shout('onUnhandledError', error, stackTrace);
}
