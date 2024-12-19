
// ignore_for_file: non_constant_identifier_names

class Insurance{
  final int id;
  final String title;
  final String image_url;
  final String subtitle;
  final String provider;
  final String description;
  final List plans;

  Insurance({
    required this.id,
    required this.title,    
    required this.image_url,
    required this.subtitle,
    required this.provider,
    required this.description,
    required this.plans,
  });
}