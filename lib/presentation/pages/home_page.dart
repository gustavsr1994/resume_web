import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_web/config/themes/color_pallete.dart';
import 'package:resume_web/config/themes/style_text.dart';
import 'package:resume_web/presentation/controllers/profile/profile_bloc.dart';
import 'package:resume_web/presentation/widgets/header.dart';
import 'package:resume_web/presentation/widgets/image_network_circle.dart';
import 'package:resume_web/presentation/widgets/socmed_button.dart';

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

    return Scaffold(
      key: scaffoldKey,
      body: Container(
        height: sized.height,
        width: sized.width,
        decoration: const BoxDecoration(
          color: colorBlack,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                          return Container(
                            width: sized.width,
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: ListView(shrinkWrap: true, children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ImageNetworkCircle(state.urlPhoto, 7),
                                  SizedBox(
                                    width: sized.width / 25,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.dataEntity.name,
                                        style: styleTextMedium(
                                            colorGoldLight, FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: sized.width / 25,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              state.dataEntity.socmed.length,
                                          itemBuilder: (context, index) =>
                                              SocmedButton(
                                                  state.dataEntity.socmed[index]
                                                      .icon,
                                                  state.dataEntity.socmed[index]
                                                      .link),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                state.dataEntity.desc,
                                textAlign: TextAlign.justify,
                                style: styleTextSmall(
                                    colorGoldLight, FontWeight.normal),
                              ),
                            ]),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state is ProfileSuccess) {
                        return Card(
                          elevation: 5,
                          color: colorBlack,
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(color: colorWhite),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Container(
                            height: sized.height / 13,
                            width: sized.width,
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(state.dataEntity.education.name,
                                      style: styleTextMedium(
                                          colorGoldLight, FontWeight.bold)),
                                  Text(state.dataEntity.education.major,
                                      style: styleTextSmall(
                                          colorGoldLight, FontWeight.normal)),
                                ]),
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state is ProfileSuccess) {
                        return Card(
                          elevation: 5,
                          color: colorBlack,
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(color: colorWhite),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: ExpandableNotifier(
                              child: ExpandablePanel(
                                  theme: const ExpandableThemeData(
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      tapBodyToCollapse: true,
                                      iconColor: colorGoldLight),
                                  header: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Text('Skill Technology',
                                        style: styleTextMedium(
                                            colorGoldLight, FontWeight.bold)),
                                  ),
                                  collapsed: const SizedBox(),
                                  expanded: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: Wrap(
                                      children: state.dataEntity.listTech
                                          .map((element) => Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 3,
                                                        horizontal: 5),
                                                child: Chip(
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          30))),
                                                  label: Text(element.name,
                                                      style: styleTextSmall(
                                                          colorGoldLight,
                                                          FontWeight.normal)),
                                                  backgroundColor: colorBlack,
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  ))),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                )
              ],
            ),
            Header(0, sized.height)
          ],
        ),
      ),
    );
  }
}
