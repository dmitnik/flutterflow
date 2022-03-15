// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom action code
import 'dart:math' as math;

Future textToUpper(String text) async {
  return '${text[0].toUpperCase()}${text.substring(1).toLowerCase()}';
}
