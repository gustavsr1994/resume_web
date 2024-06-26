import 'package:flutter/material.dart';
import 'package:resume_web/presentation/widgets/image_network_square.dart';
import 'package:url_launcher/url_launcher.dart';

class SocmedButton extends StatelessWidget {
  final String nameIcon;
  final String link;

  final num heightBox;
  const SocmedButton(this.nameIcon, this.link, this.heightBox, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => _launchUrl(link),
        child: Container(
          margin: const EdgeInsets.only(right: 15),
          child: ImageNetworkSquare(nameIcon, 10, heightBox),
        ));
  }

  Future<void> _launchUrl(String link) async {
    if (!await launchUrl(Uri.parse(link))) {
      throw Exception('Could not launch');
    }
  }
}
