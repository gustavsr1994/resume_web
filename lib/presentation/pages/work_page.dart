import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_web/config/themes/color_pallete.dart';
import 'package:resume_web/config/themes/style_text.dart';
import 'package:resume_web/presentation/controllers/profile/profile_bloc.dart';
import 'package:resume_web/presentation/widgets/header.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
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
          Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileSuccess) {
                      return Container(
                        height: sized.height / 1.5,
                        width: sized.width,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: ListView.builder(
                          itemCount: state.dataEntity.listWork.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 5,
                              color: colorBlack,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: colorWhite),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: ExpandablePanel(
                                  theme: const ExpandableThemeData(
                                      hasIcon: true, iconColor: colorGoldLight),
                                  header: Text(
                                    state.dataEntity.listWork[index].office!,
                                    style: styleTextLarge(
                                      colorGoldLight,
                                      FontWeight.bold,
                                    ),
                                  ),
                                  collapsed: const SizedBox(),
                                  expanded: Container(
                                    width: sized.width,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          
                                          Text(
                                              state.dataEntity.listWork[index]
                                                  .job!,
                                              style: styleTextMedium(
                                                  colorGoldLight,
                                                  FontWeight.normal)),
                                          Text(
                                              state.dataEntity.listWork[index]
                                                  .period!,
                                              style: styleTextMedium(
                                                  colorGoldLight,
                                                  FontWeight.normal)),
                                        ]),
                                  ),
                                ),
                              ),
                            );
                            // return Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 50),
                            //   child: Card(
                            //     elevation: 5,
                            //     color: colorBlack,
                            //     shape: const RoundedRectangleBorder(
                            //         side: BorderSide(color: colorWhite),
                            //         borderRadius: BorderRadius.all(
                            //             Radius.circular(15))),
                            //     child: Container(
                            //       height: sized.height / 4,
                            //       width: sized.width,
                            //       margin: const EdgeInsets.symmetric(
                            //           vertical: 10, horizontal: 10),
                            //       child: Column(
                            //           crossAxisAlignment:
                            //               CrossAxisAlignment.center,
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.center,
                            //           children: [
                            //             Text(
                            //                 state.dataEntity.listWork[index]
                            //                     .office!,
                            //                 style: styleTextLarge(
                            //                     colorGoldLight,
                            //                     FontWeight.bold)),
                            //             Text(
                            //                 state.dataEntity.listWork[index]
                            //                     .job!,
                            //                 style: styleTextMedium(
                            //                     colorGoldLight,
                            //                     FontWeight.normal)),
                            //             Text(
                            //                 state.dataEntity.listWork[index]
                            //                     .period!,
                            //                 style: styleTextMedium(
                            //                     colorGoldLight,
                            //                     FontWeight.normal)),
                            //           ]),
                            //     ),
                            //   ),
                            // );
                          },
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                )),
          ),
          Header(1, sized.height)
        ],
      ),
    ));
  }
}
