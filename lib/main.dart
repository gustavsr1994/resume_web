import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_web/config/routes/route_path.dart';
import 'package:resume_web/config/themes/color_pallete.dart';
import 'package:resume_web/firebase_options.dart';
import 'package:resume_web/presentation/controllers/profile/profile_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: MaterialApp.router(
        title: 'Gustav S R',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: colorGoldLight),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
