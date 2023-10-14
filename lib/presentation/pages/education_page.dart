import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_web/config/themes/color_pallete.dart';
import 'package:resume_web/config/themes/style_text.dart';
import 'package:resume_web/presentation/controllers/profile/profile_bloc.dart';
import 'package:resume_web/presentation/widgets/header.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: sized.height,
      width: sized.width,
      decoration: const BoxDecoration(
        color: colorBlack,
      ),
      child: Stack(
        children: [
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileSuccess) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Card(
                      elevation: 5,
                      color: colorBlack,
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: colorWhite),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Container(
                        height: sized.height / 4,
                        width: sized.width,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(state.dataEntity.education.name,
                                  style: styleTextLarge(
                                      colorGoldLight, FontWeight.bold)),
                              Text(state.dataEntity.education.major,
                                  style: styleTextMedium(
                                      colorGoldLight, FontWeight.normal)),
                              Text(state.dataEntity.education.point.toString(),
                                  style: styleTextMedium(
                                      colorGoldLight, FontWeight.normal)),
                            ]),
                      ),
                    ),
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          ),
          Header(1, sized.height)
        ],
      ),
    ));
  }
}
