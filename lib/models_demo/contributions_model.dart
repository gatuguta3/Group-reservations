class Contributions {
  late final int  userid;
  late final int contributionid;
  late final int groupid;
  late final String groupname;
  late final String contributiontype;  
  late final String upcomingdate;
  late final String amount;

  Contributions({
    required this.userid,
    required this.contributionid,
    required this.groupid,
    required this.groupname,
    required this.contributiontype,
    required this.upcomingdate,
    required this.amount,
  });
}