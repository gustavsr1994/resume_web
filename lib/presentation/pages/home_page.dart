import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_web/config/themes/color_pallete.dart';
import 'package:resume_web/config/themes/style_text.dart';
import 'package:resume_web/presentation/controllers/profile/profile_bloc.dart';
import 'package:resume_web/presentation/widgets/header.dart';
import 'package:resume_web/presentation/widgets/image_network_circle.dart';

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
            Center(
              child: Padding(
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
                          height: sized.height / 1.5,
                          width: sized.width,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: ListView(shrinkWrap: true, children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ImageNetworkCircle(state.urlPhoto, 6),
                                SizedBox(
                                  width: sized.width / 35,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      state.dataEntity.name,
                                      style: styleTextLarge(
                                          colorGoldLight, FontWeight.bold),
                                    ),
                                    // ListView.builder(itemBuilder: (context, index) {
                                    //   return Text(state.dataEntity.)
                                    // },)
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
                              style: styleTextMedium(
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
            ),
            Header(0, sized.height)
          ],
        ),
      ),
    );
  }
}
