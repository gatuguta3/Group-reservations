// ignore_for_file: non_constant_identifier_names

class Events{
   final int id;
   final String image_url;
   final String title;
   final String description;
   final String location;
   final String venue;
   final String occasion;
   final String subtitle;
   final String package_activities;
   final String start_date;
   final String end_date;
   final List packages;

  

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
    required this.packages,
  

  });
  
}