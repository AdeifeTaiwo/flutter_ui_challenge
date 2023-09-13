import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_challenge/screens/current_trip_detail_screen/current_trip_body.dart';
import '../../constants.dart';
import '../home/body.dart';


class CurrentTripDetailScreen extends StatelessWidget {
  const CurrentTripDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const CurrentTripBody(),

    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/cancel_2.svg'),
          onPressed: ()  {
            Navigator.pop(context);
          },
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
