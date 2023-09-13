import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/Trips.dart';
import 'package:flutter_ui_challenge/constants.dart';
import 'package:flutter_ui_challenge/screens/home/item_cards.dart';
import 'package:flutter_ui_challenge/screens/home_details_screen/home_details.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: GestureDetector(
          onTap: ()=> {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeDetailsScreen()))

          },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Text('Your Trips',
                    style: GoogleFonts.inter(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 40,
              ),
              Text('Current Trip',
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Container(
                  height: size.height,
                  width: size.width,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      buildCurrentTripStackView(size),

                      const SizedBox(
                        height: 10,
                      ),
                      Text('Past Trips',
                          style: GoogleFonts.inter(
                              fontSize: 18, fontWeight: FontWeight.bold)),

                      const SizedBox(
                        height: 20,
                      ),

                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding / 4),
                        child: GridView.builder(
                            itemCount: roadTrips.length,
                            physics: const ScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: kDefaultPadding,
                                    crossAxisSpacing: kDefaultPadding,
                                    childAspectRatio: 0.75
                                ),
                            itemBuilder: (context, index) => ItemCard(
                                roadTrip: roadTrips[index],
                                onPressItemCard: () => {
                                  }
                            )
                        ),
                      )),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Stack buildCurrentTripStackView(Size size) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              width: size.width,
              height: 400,
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
          margin: const EdgeInsets.only(top: 280),
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
        const OvalImages(
          marginLeft: 24,
          imageAsset: 'assets/images/avatar_head.png',
        ),
        const OvalImages(
            marginLeft: 54, imageAsset: 'assets/images/background.jpg'),
        const OvalImages(marginLeft: 84)
      ],
    );
  }
}

class OvalImages extends StatelessWidget {
  final double marginLeft;
  final String imageAsset;

  const OvalImages({
    super.key,
    required this.marginLeft,
    this.imageAsset = 'assets/images/head_avatar.jpeg',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 386, left: marginLeft),
      padding: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2.0)),
      child: DecoratedBox(
          decoration: const BoxDecoration(
              color: Colors.transparent, shape: BoxShape.circle),
          child: ClipOval(
            child: Hero(
              tag: imageAsset,
              child: Image.asset(imageAsset,
                  height: 32, width: 32, fit: BoxFit.cover),
            ),
          )),
    );
  }
}

