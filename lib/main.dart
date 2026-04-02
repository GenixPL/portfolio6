import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:portfolio6/app.dart';

void main() {
  // Removes the '#' from the URL
  usePathUrlStrategy();

  runApp(const MyApp());
}
