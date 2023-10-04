import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_web/config/themes/color_pallete.dart';

class SideNavigation extends StatelessWidget {
  final bool statusSide;
  const SideNavigation(this.statusSide, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: colorGoldLight,
        child: ListView(
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Beranda',
                    style: TextStyle(
                      color: colorBlack,
                      fontSize: statusSide ? 18 : 14,
                      fontWeight:
                          statusSide ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  statusSide
                      ? const SizedBox()
                      : const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: colorBlack,
                          size: 18,
                        )
                ],
              ),
              onTap: () {
                context.pushReplacement('/');
              },
            ),
            const Divider(color: colorWhite),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Unduh App',
                    style: TextStyle(
                      color: colorBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: colorBlack,
                    size: 18,
                  )
                ],
              ),
              onTap: () {},
            ),
            const Divider(color: colorWhite),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Masuk/Daftar',
                    style: TextStyle(
                      color: colorBlack,
                      fontSize: statusSide ? 14 : 18,
                      fontWeight:
                          statusSide ? FontWeight.normal : FontWeight.bold,
                    ),
                  ),
                  statusSide
                      ? const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: colorBlack,
                          size: 18,
                        )
                      : const SizedBox()
                ],
              ),
              onTap: () {
                context.go('/login');
              },
            ),
            const Divider(color: colorWhite),
          ],
        ));
  }
}
