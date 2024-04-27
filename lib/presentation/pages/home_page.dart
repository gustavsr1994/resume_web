import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_web/config/themes/color_pallete.dart';
import 'package:resume_web/config/themes/style_text.dart';
import 'package:resume_web/presentation/controllers/profile/profile_bloc.dart';
import 'package:resume_web/presentation/widgets/header.dart';
import 'package:resume_web/presentation/widgets/header_expandable.dart';
import 'package:resume_web/presentation/widgets/image_network_circle.dart';
import 'package:resume_web/presentation/widgets/socmed_button.dart';

import '../../domain/entity/profile_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String pathImage = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    context.read<ProfileBloc>().add(GetProfile());
  }

  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size;

    return AdaptiveLayout(
      key: scaffoldKey,
      body: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
        Breakpoints.large: SlotLayout.from(
            key: const Key('Body Large'),
            builder: (context) =>
                bodyDataProfile(sized, 110, Header(0, sized.height))),
        Breakpoints.medium: SlotLayout.from(
          key: const Key('Body Medium'),
          builder: (context) =>
              bodyDataProfile(sized, 130, Header(0, sized.height)),
        ),
        Breakpoints.small: SlotLayout.from(
          key: const Key('Body Small'),
          builder: (context) =>
              bodyDataProfile(sized, 150, Header(0, sized.height)),
        ),
      }),
    );
  }

  Widget bodyDataProfile(Size sized, num height, Widget header) {
    return Container(
      height: sized.height,
      width: sized.width,
      decoration: const BoxDecoration(
        color: colorBlack,
      ),
      child: ListView(
        children: [
          header,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Card(
              elevation: 5,
              color: colorBlack,
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: colorWhite),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileSuccess) {
                    return bodyProfile(
                        sized, height, state.urlPhoto, state.dataEntity);
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: Card(
              elevation: 5,
              color: colorBlack,
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: colorWhite),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileSuccess) {
                    return bodyTech(sized, state.dataEntity);
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bodyProfile(
      Size sized, num height, String urlPhoto, ProfileEntity dataEntity) {
    return Container(
      height: sized.height,
      width: sized.width,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListView(shrinkWrap: true, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageNetworkCircle(urlPhoto, 6),
            SizedBox(
              height: sized.width / 25,
            ),
            Text(
              dataEntity.name,
              style: styleTextLarge(colorGoldLight, FontWeight.bold),
            ),
            Text(
              dataEntity.education.major,
              style: styleTextMedium(colorGoldLight, FontWeight.normal),
            ),
            SizedBox(
              height: sized.width / 45,
            ),
            SizedBox(
              height: sized.height / 15,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: dataEntity.socmed.length,
                itemBuilder: (context, index) => SocmedButton(
                    dataEntity.socmed[index].icon,
                    dataEntity.socmed[index].link,
                    height),
              ),
            ),
            SizedBox(
              height: sized.width / 25,
            ),
            Text(
              dataEntity.desc,
              textAlign: TextAlign.justify,
              style: styleTextLarge(colorGoldLight, FontWeight.normal),
            ),
          ],
        ),
      ]),
    );
  }

  Widget bodyTech(Size sized, ProfileEntity dataEntity) {
    return Container(
      height: sized.height / 5,
      width: sized.width,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Technology",
            style: styleTextLarge(
              colorGoldLight,
              FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: dataEntity.listTech.length,
              itemBuilder: (context, index) {
                var nameTech = dataEntity.listTech[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Chip(
                      color: const MaterialStatePropertyAll(colorBlack),
                      side: const BorderSide(color: colorGoldLight),
                      label: Text(
                        nameTech.name,
                        style: styleTextSmall(colorGoldLight, FontWeight.bold),
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
