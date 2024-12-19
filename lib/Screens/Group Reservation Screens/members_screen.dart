// ignore_for_file: sort_child_properties_last, non_constant_identifier_names, use_super_parameters

import 'package:flutter/material.dart';
import 'package:group_reservations/Config/themes.dart';
import 'package:group_reservations/Models/group_members_model.dart';
import 'package:group_reservations/Services/Demo_data/group_members_demodata.dart';

class MembersScreen extends StatefulWidget {
  final int group_id;

  const MembersScreen({Key? key, required this.group_id}) : super(key: key);

  @override
  State<MembersScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  final GroupMembersDemodata groupMembersDemodata = GroupMembersDemodata();
  final List<GroupMembers> selectedMembers = [];
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Text(
          'Members',
          style: TextStyle(fontSize: 21, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                hintText: "Search members...",
                prefixIcon: Icon(Icons.list, color: Colors.grey),
                suffixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          // Members List

Expanded(
              child: FutureBuilder<List<GroupMembers>>(
                future: groupMembersDemodata.fetch_groupmembers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No members found.'));
                  }

                  // Filter members by group_id and search query
                  final members = snapshot.data!
                      .where((member) =>
                          member.groupid == widget.group_id &&
                          member.name.toLowerCase().contains(searchQuery))
                      .toList();

                  if (members.isEmpty) {
                    return Center(child: Text('No members match your search.'));
                  }

                  return ListView.builder(
                    itemCount: members.length,
                    itemBuilder: (context, index) {
                      final member = members[index];
                      final isSelected = selectedMembers.contains(member);

                      return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        elevation: 0,
                        child: ListTile(
                          leading: CircleAvatar(backgroundImage: AssetImage(member.profile_image_url)),
                          title: Text(
                            member.name,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(member.phonenumber.isNotEmpty ? member.phonenumber : 'No phone number'),
                          trailing: Checkbox(
                            value: isSelected,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50), // Round shape
                            ),
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            side: BorderSide(color: Colors.black, width: 2),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == true) {
                                  selectedMembers.add(member); // Add member to selected list
                                } else {
                                  selectedMembers.remove(member); // Remove member from selected list
                                }
                              });
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
        
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedMembers.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: primarycolor,
                content: Text('No members selected.'),
              ),
            );
          } else {
            Navigator.pop(context, selectedMembers);
          }
        },
        backgroundColor: primarycolor,
        child: Icon(Icons.arrow_right_alt),
        tooltip: 'Confirm Selection',
      ),
    );
  }
}
