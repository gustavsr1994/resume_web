import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_web/config/responsive_config.dart';
import 'package:resume_web/config/themes/color_pallete.dart';

class Header extends StatelessWidget {
  final bool typeLogo;
  final double sizeHeight;
  final ScrollController scrollController;
  final Function() functionSidebar;
  const Header(this.typeLogo, this.sizeHeight, this.scrollController,
      this.functionSidebar,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height / 10,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => typeLogo
                ? scrollController.animateTo(0,
                    duration: const Duration(seconds: 1), curve: Curves.ease)
                : context.pop(),
            child: Image.asset(
                "lib/presentation/assets/images/${typeLogo ? "logo_wizh" : "logo_wizh_white"}.png",
                height: 40),
          ),
          ResponsiveConfig.isSmallScreen(context)
              ? InkWell(
                  onTap: functionSidebar,
                  child: Icon(Icons.dehaze_outlined,
                      color: typeLogo
                          ? setColor(sizeHeight, size.height, colorGoldLight,
                              colorWhite)
                          : colorWhite))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          typeLogo ? null : context.pop();
                        },
                        child: Text(
                          "Beranda",
                          style: TextStyle(
                            color: setColor(sizeHeight, size.height, colorBlack,
                                colorWhite),
                            fontWeight:
                                typeLogo ? FontWeight.bold : FontWeight.normal,
                          ),
                        )),
                    TextButton(
                        onPressed: () {
                          print("DOWNLOAD");
                        },
                        child: Text(
                          "Unduh App",
                          style: TextStyle(
                              color: setColor(sizeHeight, size.height,
                                  colorBlack, colorWhite)),
                        )),
                    TextButton(
                        onPressed: () {
                          context.go("/login");
                        },
                        child: Text(
                          "Masuk/Daftar",
                          style: TextStyle(
                            color: setColor(sizeHeight, size.height, colorBlack,
                                colorWhite),
                            fontWeight:
                                typeLogo ? FontWeight.normal : FontWeight.bold,
                          ),
                        ))
                  ],
                ),
        ],
      ),
    );
  }

  Color setColor(double currentHeight, double deviceHeight, Color colorMain,
      Color colorSecondary) {
    if ((currentHeight == deviceHeight) || (currentHeight >= deviceHeight)) {
      if (currentHeight >= 2 * deviceHeight) {
        return colorMain;
      } else {
        return colorSecondary;
      }
    } else {
      return colorMain;
    }
  }
}
