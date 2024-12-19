
import 'package:group_reservations/Models/experiences_model.dart';

class ExperiencesDemodata{

  Future<List<Experiences>> fetch_experiences () async {
    // await Future.delayed(Duration(seconds: 1));
     List<Experiences> experiences_list =[
      Experiences(
        id: 1,
        image_url: 'images/beachview.jpeg',
        title: 'Beach Getaway',
        description: 'A relaxing weekend at the beach with sun and sand.',
        location: 'Malibu, California',
        venue: 'Beach resort',
        occasion: 'Vacation',
        subtitle: 'with you every step of the way',
        package_activities: 'Swimming, Surfing, Beach Volleyball',
        start_date: '10-12-2024',
        end_date:   '21-12-2024',
        standard_price: 4500,
        standard_status: 'Active',
        standard_max_people: 15,
        premium_price: 6000,
        premium_status: 'Active',
        premium_max_people: 20,
      ),
      Experiences(
        id: 2,
        image_url: 'images/beach2.jpeg',
        title: 'Beach Getaway',
        description: 'A relaxing weekend at the beach with sun and sand.',
        location: 'Malibu, California',
        venue: 'Beach resort',
        occasion: 'Vacation',
        subtitle: 'with you every step of the way',
        package_activities: 'Swimming, Surfing, Beach Volleyball',
        start_date: '10-12-2024',
        end_date: '20-12-2024',
        standard_price: 4500,
        standard_status: 'Active',
        standard_max_people: 15,
        premium_price: 6000,
        premium_status: 'Active',
        premium_max_people: 20,
      ),
      Experiences(
        id: 3,
        image_url: 'images/beach3.jpeg',
        title: 'Beach Getaway',
        description: 'A relaxing weekend at the beach with sun and sand.',
        location: 'Malibu, California',
        venue: 'Beach resort',
        occasion: 'Vacation',
        subtitle: 'with you every step of the way',
        package_activities: 'Swimming, Surfing, Beach Volleyball',
        start_date: '10-12-2024',
        end_date: '19-12-2024',
        standard_price: 5500,
        standard_status: 'Active',
        standard_max_people: 15,
        premium_price: 7800,
        premium_status: 'Active',
        premium_max_people: 20,
      ),
      Experiences(
        id: 4,
        image_url: 'images/beach4.jpeg',
        title: '5 start hotel Experience',
        description: 'A relaxing weekend at the beach with sun and sand . Sand basking will from 10-12 am , all activities including jet skiing and snowkerling will be done on order from the main office',
        location: 'Malibu, California',
        venue: 'Beach resort',
        occasion: 'Vacation',
        subtitle: 'with you every step of the way',
        package_activities: 'Swimming, Surfing, Beach Volleyball',
        start_date: '10-12-2024',
        end_date: '19-12-2024',
        standard_price: 3500,
        standard_status: 'Active',
        standard_max_people: 15,
        premium_price: 7000,
        premium_status: 'Active',
        premium_max_people: 20,
      ),
      Experiences(
        id: 5,
        image_url: 'images/beachview.jpeg',
        title: 'Christmas re - incarnation',
        description: 'A relaxing weekend at the beach with sun and sand . Sand basking will from 10-12 am , all activities including jet skiing and snowkerling will be done on order from the main office',
        location: 'Malibu, California',
        venue: 'Beach resort',
        occasion: 'Vacation',
        subtitle: 'with you every step of the way',
        package_activities: 'Swimming, Surfing, Beach Volleyball',
        start_date: '10-12-2024',
        end_date: '19-12-2024',
        standard_price: 7500,
        standard_status: 'Active',
        standard_max_people: 15,
        premium_price: 10000,
        premium_status: 'Inactive',
        premium_max_people: 20,
      ),
      
     ];
     return experiences_list;
  }
}

