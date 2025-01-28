// ignore_for_file: sort_child_properties_last, non_constant_identifier_names, use_super_parameters

import 'package:flutter/material.dart';
import 'package:group_reservations/components/themes.dart';
import 'package:group_reservations/constants/colors.dart';
import 'package:group_reservations/models_demo/group_members_model.dart';
import 'package:group_reservations/services_demo/group_members_demodata.dart';

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
  List<GroupMembers> allMembers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMembers();
  }

  void _loadMembers() async {
    try {
      final members = await groupMembersDemodata.fetch_groupmembers();
      setState(() {
        allMembers = members
            .where((member) => member.groupid == widget.group_id)
            .toList();
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading members: $error')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {

    // code to filter members when the user uses the search bar
     final filteredMembers = allMembers
        .where((member) =>
            member.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
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
                  searchQuery = value;
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
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : filteredMembers.isEmpty
                    ? Center(child: Text('No members match your search.'))
                    : ListView.builder(
                        itemCount: filteredMembers.length,
                        itemBuilder: (context, index) {
                          final member = filteredMembers[index];
                          final isSelected = selectedMembers.contains(member);

                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            elevation: 0,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage(member.profile_image_url),
                              ),
                              title: Text(
                                member.name,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                member.phonenumber.isNotEmpty
                                    ? member.phonenumber
                                    : 'No phone number',
                              ),
                              trailing: Checkbox(
                                value: isSelected,
                                activeColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                side: BorderSide(
                                    color: Colors.black, width: 2),
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value == true) {
                                      selectedMembers.add(member);
                                    } else {
                                      selectedMembers.remove(member);
                                    }
                                  });
                                },
                              ),
                            ),
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
                backgroundColor: AppColors.primary,
                content: Text('No members selected.'),
              ),
            );
          } else {
            Navigator.pop(context, selectedMembers);
          }
        },
        backgroundColor: AppColors.primary,
        child: Image.asset('icons/right_arrow.png'),
        tooltip: 'Confirm Selection',
      ),
    );
  }
}
