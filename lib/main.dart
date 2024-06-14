import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    DevicePreview(
      builder: (context) => const App(),
    ),
  ); 
}