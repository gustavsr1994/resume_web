import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/themes/color_pallete.dart';
import '../../config/themes/style_text.dart';

class HeaderExpandable extends StatelessWidget {
  final int indexPage;
  final double sizeHeight;
  const HeaderExpandable(this.indexPage, this.sizeHeight, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        bottomSheetCustom(context, size.width / 360, indexPage);
      },
      child: Container(
          width: size.width,
          height: size.height / 10,
          margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: colorGoldLight),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: selectText(indexPage),
              ),
              const Icon(
                Icons.arrow_drop_down_outlined,
                color: colorWhite,
              )
            ],
          )),
    );
  }

  Widget selectText(int index) {
    switch (index) {
      case 0:
        return Text("Home",
            style: styleTextMedium(colorGoldLight, FontWeight.bold));
      case 1:
        return Text("Work",
            style: styleTextMedium(colorGoldLight, FontWeight.bold));
      case 2:
        return Text("Portofolio",
            style: styleTextMedium(colorGoldLight, FontWeight.bold));
      default:
        return const SizedBox();
    }
  }

  void bottomSheetCustom(
    BuildContext context,
    double scaleWidth,
    int index,
  ) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: colorBlack,
              content: Container(
                height: 200 * scaleWidth,
                width: scaleWidth * 200,
                decoration: BoxDecoration(
                    color: colorBlack,
                    border: Border.all(color: colorGoldLight),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 3 * scaleWidth),
                        height: 2 * scaleWidth,
                        width: 30 * scaleWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: colorBlack),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListView(
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  indexPage == 0 ? null : context.pop(),
                              child: Card(
                                color: indexPage == 0
                                    ? colorGoldLight
                                    : colorBlack,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    side: BorderSide(color: colorGoldLight)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: Text('HOME',
                                      style: styleTextMedium(
                                          indexPage == 0
                                              ? colorBlack
                                              : colorGoldLight,
                                          FontWeight.bold)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.pop();
                                context.go('/work');
                              },
                              child: Card(
                                color: indexPage == 1
                                    ? colorGoldLight
                                    : colorBlack,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    side: BorderSide(color: colorGoldLight)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: Text('WORK',
                                      style: styleTextMedium(
                                          indexPage == 1
                                              ? colorBlack
                                              : colorGoldLight,
                                          FontWeight.bold)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Card(
                                color: indexPage == 2
                                    ? colorGoldLight
                                    : colorBlack,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    side: BorderSide(color: colorGoldLight)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: Text('PORTOFOLIO',
                                      style: styleTextMedium(
                                          indexPage == 2
                                              ? colorBlack
                                              : colorGoldLight,
                                          FontWeight.bold)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
