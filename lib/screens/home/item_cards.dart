import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/Trips.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import 'body.dart';

class ItemCard extends StatelessWidget {
  final RoadTrip roadTrip;
  final Function onPressItemCard;

  const ItemCard(
      {required this.roadTrip,
        required this.onPressItemCard,
        super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: kDefaultPadding/2),
      child: GestureDetector(
        onTap: () => {onPressItemCard},
        child: Column(
          children: [
            Expanded(
              child: Stack(

                children: [
                  Container(
                      height: 250,
                        width: 200,
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(8)),

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset(
                            roadTrip.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding/4),
                    margin: const EdgeInsets.only(top: 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(roadTrip.date,
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey)),
                        const SizedBox(height: 20),

                        Text(roadTrip.description,
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                ],

              ),
            )
          ],
        ),
      ),
    );
  }
}
