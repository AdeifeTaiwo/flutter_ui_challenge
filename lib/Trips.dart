


class RoadTrip {
  final String date, description, image;

  RoadTrip(
      {required this.date,
        required this.description,
        required this.image}
      );
}

List<RoadTrip> roadTrips = [
  RoadTrip(
    date: 'May 27-30',
    description: 'Road Trip Over Italian Riveria',
    image: 'assets/images/background.jpg'
  ),
  RoadTrip(
      date: 'Jan 27-30',
      description: 'Weekend in Lisbon',
      image: 'assets/images/background.jpg'
  ),
  RoadTrip(
      date: 'May 27-30',
      description: 'Trip To Nigeria',
      image: 'assets/images/background_2.jpg'
  ),
  RoadTrip(
      date: 'May 27-30',
      description: 'Trip To Denmark',
      image: 'assets/images/background_2.jpg'
  )
];


