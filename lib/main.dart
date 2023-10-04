import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:resume_web/config/themes/color_pallete.dart';
import 'package:resume_web/firebase_options.dart';
import 'package:resume_web/presentation/pages/home_page.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: colorGoldLight),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
