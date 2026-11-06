/// Pure Data Class representing a Rajang River Cruise destination (Model Layer).
class CruiseDestination {
  final String name;
  final String location;
  final String description;
  final String imagePath;
  final int initialRatingCount;
  final List<String> availablePackages;

  const CruiseDestination({
    required this.name,
    required this.location,
    required this.description,
    required this.imagePath,
    required this.initialRatingCount,
    required this.availablePackages,
  });

  /// Default data for Sibu Rajang River Cruise
  factory CruiseDestination.sibuRajangCruise() {
    return const CruiseDestination(
      name: 'Rajang River Express Cruise',
      location: 'Sibu Waterfront, Sarawak',
      description:
          'Experience the heart of Sibu along Malaysia\'s longest river, the Rajang. '
          'Cruise past historic timber mills, traditional Melanau and Iban waterfront settlements, '
          'and vibrant floating markets while enjoying authentic Sarawakian hospitality and scenic heritage views.',
      imagePath: 'lib/image/river_cruise_image.jpeg',
      initialRatingCount: 41,
      availablePackages: [
        'Private River Cruise',
        'Sunset Cruise',
        'Sunrise Cruise',
        'Rural Cruise',
        'SMI Park Cruise',
      ],
    );
  }
}
