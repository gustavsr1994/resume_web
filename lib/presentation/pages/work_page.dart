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
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileSuccess) {
                return Center(
                  child: Container(
                    height: MediaQuery.sizeOf(context).height / 1.5,
                    width: MediaQuery.sizeOf(context).width,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ListView.builder(
                      itemCount: state.dataEntity.listWork.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: colorGoldLight)),
                          child: ExpandableNotifier(
                              child: ExpandablePanel(
                                  theme: const ExpandableThemeData(
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      tapBodyToCollapse: true,
                                      iconColor: colorGoldLight),
                                  header: Text(
                                      state.dataEntity.listWork[index].office!,
                                      style: styleTextMedium(
                                          colorGoldLight, FontWeight.bold)),
                                  collapsed: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            state.dataEntity.listWork[index]
                                                .job!,
                                            style: styleTextSmall(
                                                colorGoldLight,
                                                FontWeight.normal)),
                                        Text(
                                            state.dataEntity.listWork[index]
                                                .period!,
                                            style: styleTextSmall(
                                                colorGoldLight,
                                                FontWeight.normal)),
                                      ]),
                                  expanded: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: state.dataEntity.listWork[index]
                                        .listResponsible.length,
                                    itemBuilder: (context, indexResponsible) {
                                      return Text(
                                          '\u2022 ${state.dataEntity.listWork[index].listResponsible[indexResponsible].data!}',
                                          style: styleTextSmall(
                                              colorWhite, FontWeight.normal));
                                    },
                                  ))),
                        );
                      },
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          Header(1, sized.height)
        ],
      ),
    ));
  }
}
