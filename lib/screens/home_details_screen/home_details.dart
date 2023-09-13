import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/screens/current_trip_detail_screen/CurrentTripDetailScreen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../home/body.dart';

class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Route _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const  CurrentTripDetailScreen(),

        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          var curve = Curves.decelerate;
          var curveTween = CurveTween(curve: curve);
          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          transitionDuration: const Duration(seconds: 10);
          //var controller = AnimationController(, duration: Duration(seconds: 1), vsync: this);
          final offsetAnimation = animation.drive(tween);



          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      );
    }

    return Material(
      child: GestureDetector(
          onPanUpdate: (down) {
            Navigator.of(context).push(_createRoute());
          },
          onVerticalDragUpdate: (dragUpdateDetails) {
            if (dragUpdateDetails.primaryDelta! < 0) {
              Navigator.of(context).pop();
            }
            if(dragUpdateDetails.primaryDelta!> 3){
              Navigator.of(context).push(_createRoute());

            }
          },
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    width: size.width,
                    height: size.height,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      clipBehavior: Clip.hardEdge,
                      child: Hero(
                        tag: "bg_image",
                        child: Image.asset(
                          'assets/images/background_2.jpg',
                          width: size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                margin: EdgeInsets.only(top: size.height * 0.6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('May 8-19',
                        style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87)),
                    const SizedBox(height: 20),
                    Text('Riding through the lands \nof the Legends',
                        style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ],
                ),
              ),
              ImageWithNamePositionedContainer(
                size: size,
                startLeftPosition: 24,
                imageAsset: 'assets/images/avatar_head.png',
                name: 'Annie',
              ),
              ImageWithNamePositionedContainer(
                  size: size,
                  startLeftPosition: 134,
                  imageAsset: 'assets/images/background.jpg',
              name: 'Mike',),
              ImageWithNamePositionedContainer(size: size, startLeftPosition: 244, name: 'Sophie',)
            ],
          )),
    );
  }
}

class ImageWithNamePositionedContainer extends StatelessWidget {
  final Size size;
  final double startLeftPosition;
  final String imageAsset;
  final String name;

  const ImageWithNamePositionedContainer(
      {super.key,
      required this.size,
      required this.startLeftPosition,
      this.imageAsset = 'assets/images/head_avatar.jpeg', required this.name});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.8,
      left: startLeftPosition,
      width: 100,
      child: Container(
        height: 40,
        margin: const EdgeInsets.only(left: 0),
        padding: const EdgeInsets.all(2.5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: kBgColor,
            border: Border.all(color: kBgColor, width: 2.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DecoratedBox(
                decoration: const BoxDecoration(
                    color: Colors.blueGrey, shape: BoxShape.circle),
                child: ClipOval(
                  child: Hero(
                    tag: imageAsset,
                    child: Image.asset(imageAsset,
                        height: 32, width: 32, fit: BoxFit.cover),
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            Text(name,
                style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white))
          ],
        ),
      ),
    );
  }
}
