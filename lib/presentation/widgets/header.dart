import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_web/config/themes/color_pallete.dart';
import 'package:resume_web/config/themes/style_text.dart';

class Header extends StatelessWidget {
  final int indexPage;
  final double sizeHeight;
  const Header(this.indexPage, this.sizeHeight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height / 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                indexPage == 0 ? null : context.pop();
              },
              child: Text("Home",
                  style: styleTextMedium(
                      indexPage == 0 ? colorGoldLight : colorWhite,
                      indexPage == 0 ? FontWeight.bold : FontWeight.normal))),
          TextButton(
              onPressed: () {
                context.go('/work');
              },
              child: Text("Work",
                  style: styleTextMedium(
                      indexPage == 1 ? colorGoldLight : colorWhite,
                      indexPage == 1 ? FontWeight.bold : FontWeight.normal))),
          TextButton(
              onPressed: () {},
              child: Text("Portofolio",
                  style: styleTextMedium(
                      indexPage == 2 ? colorGoldLight : colorWhite,
                      indexPage == 2 ? FontWeight.bold : FontWeight.normal)))
        ],
      ),
    );
  }
}
