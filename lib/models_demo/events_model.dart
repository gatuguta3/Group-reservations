// ignore_for_file: non_constant_identifier_names

class Events{
  late final int id;
  late final String image_url;
  late final String title;
  late final String description;
  late final String location;
  late final String venue;
  late final String occasion;
  late final String subtitle;
  late final String package_activities;
  late final String start_date;
  late final String end_date;
  late final int standard_price;
  late final int premium_price;
  late final String standard_status;
  late final String premium_status;
  late final int standard_max_people;
  late final int premium_max_people;

  Events( {
    required this.id,
    required this.image_url,
    required this.title,
    required this.description,
    required this.location,
    required this.venue,
    required this.occasion,
    required this.subtitle,
    required this.package_activities,
    required this.start_date,
    required this.end_date,
    required this.standard_price,
    required this.premium_price,
    required this.premium_status,
    required this.standard_status,
    required this.standard_max_people,
    required this.premium_max_people,

  });
  
}