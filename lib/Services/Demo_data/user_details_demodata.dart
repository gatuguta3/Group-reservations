// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:group_reservations/Models/user_details_model.dart';

class UserDetailsDemodata{

  Future<List<UserDetails>> fetchuserdetails () async {
    await Future.delayed(Duration(seconds: 1));

    List<UserDetails> userdetails_list = [
      UserDetails(
        userid: 1,
        name:'Edwin',
        phonenumber: '+254708908567',
        email: 'edwin@gmail.com',
        profile_image_url: 'images/edwin.jpeg',
        role: 'Admin'
      )
    ];
      return userdetails_list;
  }

}