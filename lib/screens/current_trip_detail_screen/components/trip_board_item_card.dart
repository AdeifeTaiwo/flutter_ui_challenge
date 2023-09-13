
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/models/on_board_experience_item.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class TripBoardItemCard extends StatelessWidget{
  const TripBoardItemCard({super.key, required this.userTripExperience});

  final OnBoardExperience userTripExperience;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding/2),
      child: Row(

         children: [

           Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    border: Border.all(color: Colors.grey)),
                child: DecoratedBox(
                    decoration: const BoxDecoration(
                        color: Colors.transparent, shape: BoxShape.circle),
                    child: ClipOval(
                      child: Image.asset(userTripExperience.avatar,
                          height: 32, width: 32,
                          fit: BoxFit.cover),
                    )
                ),
              ),
          const SizedBox(
            width: kDefaultPadding / 4,
          ),

           Flexible(

             child: Container(
               margin: EdgeInsets.only(right: kDefaultPadding/2),
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.5),
               decoration: BoxDecoration(
                   shape: BoxShape.rectangle,

                   border: Border.all(color: Colors.grey, ),
               borderRadius: BorderRadius.circular(4)),
               child: DecoratedBox(
                   decoration: const BoxDecoration(
                        shape: BoxShape.rectangle),
                   child:Text(
                     userTripExperience.descText,
                       style: GoogleFonts.inter(
                           fontSize: 20,
                           fontWeight: FontWeight.normal,
                           color: Colors.black))
               ),
             ),
           ),

      ]),
    );
  }
}