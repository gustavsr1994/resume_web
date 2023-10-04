import 'dart:convert';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:resume_web/config/themes/color_pallete.dart';
import 'package:resume_web/presentation/widgets/side_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 1.0);
  double position = 0.0;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {
        position = scrollController.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const SideNavigation(true),
      body: Container(
        height: sized.height,
        width: sized.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    colorBlack.withOpacity(.8), BlendMode.darken),
                image: AssetImage("lib/presentation/assets/images/unnis.jpg"))),
        child: Center(
          child: Text(
            "This Web use Flutter",
            style: TextStyle(color: colorWhite),
          ),
        ),
      ),
    );
  }
}
