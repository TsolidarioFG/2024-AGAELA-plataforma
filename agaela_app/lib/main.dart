import 'package:agaela_app/app.dart';
import 'package:agaela_app/firebase_options.dart';
import 'package:agaela_app/locators.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  initLocator();

  runApp(const App());
}
