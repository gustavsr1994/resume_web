import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_web/config/themes/color_pallete.dart';
import 'package:resume_web/config/themes/style_text.dart';
import 'package:resume_web/presentation/controllers/profile/profile_bloc.dart';
import 'package:resume_web/presentation/widgets/side_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 1.0);
  double position = 0.0;
  String pathImage = "";
  @override
  void initState() {
    super.initState();
    getData();
    scrollController.addListener(() {
      setState(() {
        position = scrollController.offset;
      });
    });
  }

  void getData() async {
    final storageRef =
        FirebaseStorage.instance.ref().child("my_gallery/1696860774126.jpg");
    final listResult = await storageRef.getDownloadURL();
    setState(() {
      pathImage = listResult;
    });
    context.read<ProfileBloc>().add(GetProfile());
  }

  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      endDrawer: const SideNavigation(true),
      body: Container(
        height: sized.height,
        width: sized.width,
        decoration: const BoxDecoration(
          color: colorBlack,
        ),
        child: Center(
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
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.network(
                              pathImage,
                              fit: BoxFit.fill,
                              height: MediaQuery.of(context).size.width / 6,
                              width: MediaQuery.of(context).size.width / 6,
                            ),
                            Text(
                              state.dataEntity.name,
                              style: styleTextLarge(
                                  colorGoldLight, FontWeight.bold),
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
      ),
    );
  }
}
