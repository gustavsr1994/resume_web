import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:resume_web/config/themes/color_pallete.dart';
import 'package:shimmer/shimmer.dart';

class ImageNetworkSquare extends StatelessWidget {
  final String urlImage;
  final num size;

  const ImageNetworkSquare(this.urlImage, this.size, {super.key});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: urlImage,
        imageBuilder: (context, imageProvider) => Container(
              width: MediaQuery.of(context).size.width / size,
              height: MediaQuery.of(context).size.width / size,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
        progressIndicatorBuilder: (context, url, progress) =>
            Shimmer.fromColors(
              baseColor: colorGoldLight.withOpacity(.2),
              highlightColor: colorWhite,
              child: Container(
                width: MediaQuery.of(context).size.width / size,
                height: MediaQuery.of(context).size.width / size,
                decoration: const BoxDecoration(
                  color: colorWhite,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        errorWidget: (context, url, error) => Center(
                child: Image.asset(
              'lib/assets/defaultimg.png',
              width: MediaQuery.of(context).size.width / size,
              height: MediaQuery.of(context).size.width / size,
              fit: BoxFit.fill,
            )));
  }
}
