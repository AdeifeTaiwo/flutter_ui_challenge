import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/models/avatar_with_name_model.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';

class AvatarWithNameItemCard extends StatelessWidget {
  final UserInfo userInfo;

  const AvatarWithNameItemCard({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 40,
      width: 100,
      padding: const EdgeInsets.all(2.5),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kTextLightColor,
          border: Border.all(color: Colors.white70, width: 2.0)),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          DecoratedBox(
              decoration: const BoxDecoration(
                  color: Colors.blueGrey, shape: BoxShape.circle),
              child: ClipOval(
                child: Hero(
                  tag: userInfo.avatar,
                  child: Image.asset(userInfo.avatar,
                      height: 32, width: 32, fit: BoxFit.cover),
                ),
              )),
          const SizedBox(
            width: 10,
          ),
          Text(userInfo.name,
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white))
        ],
      ),
    );
  }
}
