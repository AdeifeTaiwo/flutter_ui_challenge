import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import 'body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/side_drawer.svg'),
        onPressed: () {},
      ),
      actions: [
        SizedBox(
            child: Container(
          padding: const EdgeInsets.all(2.5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey)),
          child: DecoratedBox(
            decoration: const BoxDecoration(
                color: Colors.transparent, shape: BoxShape.circle),
            child: ClipOval(
              child: Image.asset('assets/images/head_avatar.jpeg',
                  height: 32, width: 32,
                  fit: BoxFit.cover),
            )
          ),
        )),
        const SizedBox(
          width: kDefaultPadding / 2,
        )
      ],
    );
  }
}
