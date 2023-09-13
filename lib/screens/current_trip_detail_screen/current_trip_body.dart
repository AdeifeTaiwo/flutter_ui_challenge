import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/Trips.dart';
import 'package:flutter_ui_challenge/models/avatar_with_name_model.dart';
import 'package:flutter_ui_challenge/models/on_board_experience_item.dart';
import 'package:flutter_ui_challenge/screens/current_trip_detail_screen/components/trip_board_item_card.dart';
import 'package:flutter_ui_challenge/screens/home/item_cards.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../home_details_screen/home_details.dart';
import 'components/avatar_with_name_item_card.dart';

class CurrentTripBody extends StatefulWidget {
  const CurrentTripBody({super.key});

  @override
  State<StatefulWidget> createState() => _CurrentTripState();
}

class _CurrentTripState extends State<CurrentTripBody> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Route _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const  HomeDetailsScreen(),

        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0);
          const end = Offset.zero;
          var curve = Curves.decelerate;
          var curveTween = CurveTween(curve: curve);
          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);
          lerpDuration(const Duration(seconds: 0), const Duration(seconds: 50), .2);


          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      );
    }

    return SingleChildScrollView(

      child: GestureDetector(

        onVerticalDragUpdate: (dragUpdateDetails) {
          if (dragUpdateDetails.primaryDelta! < 0) {
            Navigator.of(context).pop();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Riding Through the \nlands of the Legends',
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(
                  height: 20,
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 3),
                  curve: Curves.easeIn,
                  height: 40,
                  width: size.width,
                  child: ListView.builder(
                    itemCount: userDetail.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return AvatarWithNameItemCard(
                          userInfo: userDetail[index]);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 3),
                  curve: Curves.easeIn,
                  height: 250,
                  width: size.width,
                  child: ListView.builder(
                    itemCount: roadTrips.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemCard(
                        roadTrip: roadTrips[index],
                        onPressItemCard: () {},
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text('Trip Board',
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Container(
                  height: 250,
                  width: size.width,
                  padding: EdgeInsets.only(top: kDefaultPadding),
                  child: ListView.builder(
                    itemCount: userTripExperence.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return TripBoardItemCard(
                          userTripExperience: userTripExperence[index]);
                    },
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
