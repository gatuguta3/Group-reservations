
// ignore_for_file: non_constant_identifier_names

import 'package:group_reservations/Models/group_members_model.dart';

class GroupMembersDemodata{

  Future<List<GroupMembers>> fetch_groupmembers () async {

  //  await Future.delayed(Duration(seconds: 1));

    List<GroupMembers> group_members_list =[
      GroupMembers(
        groupid : 1,
        userid : 1,
        name : 'Edwin Sifuna',
        phonenumber : '+254708908567',
        profile_image_url: 'images/edwin.jpeg',
      ),
      GroupMembers(
        groupid : 1,
        userid : 2,
        name : 'Del rimono',
        phonenumber : '+254708908567',
        profile_image_url: 'images/edwin.jpeg',
      ),
      GroupMembers(
        groupid : 1,
        userid : 3,
        name : 'Gen',
        phonenumber : '+254708908567',
        profile_image_url: 'images/edwin.jpeg',
      ),
      GroupMembers(
        groupid : 2,
        userid : 4,
        name : 'Ben',
        phonenumber : '+254708908567',
        profile_image_url: 'images/edwin.jpeg',
      ),
      GroupMembers(
        groupid : 2,
        userid : 5,
        name : 'Kennneth',
        phonenumber : '+254708908567',
        profile_image_url: 'images/edwin.jpeg',
      ),
      GroupMembers(
        groupid : 2,
        userid : 6,
        name : 'Bennet',
        phonenumber : '+254708908567',
        profile_image_url: 'images/edwin.jpeg',
      ),
      GroupMembers(
        groupid : 2,
        userid : 7,
        name : 'Syrus maina',
        phonenumber : '+254708908567',
        profile_image_url: 'images/edwin.jpeg',
      ),
      

    ];
    return group_members_list;
  }
}