import 'package:coworker_mobile/config/app_color.dart';
import 'package:flutter/material.dart';

class TeamMembersPage extends StatelessWidget {
  final List<Map<String, String>> teamMembers = [
    {'name': 'Amrin Alamsyah Bugis', 'nim': '210101D003'},
    {'name': 'Nirsan', 'nim': '210101C089'},
    {'name': 'Niluh Putu Ayu Cahyani', 'nim': '210101E150'},
    {'name': 'Rahmad R Wasuwamba', 'nim': '210101D117'},
    {'name': 'Juniansyah Abdul R Soulisa', 'nim': '210101F172'},
    {'name': 'Muhamad Bahman Kilbaren', 'nim': '210101C087'},
    {'name': 'Derius Broztito Renyaan', 'nim': '210101E133'},
    {'name': 'Fivin Kaimudin', 'nim': '210101C079'},
    {'name': 'Jayani Ahmad', 'nim': '210101D122'},
    // Tambahkan anggota tim lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Anggota Tim'),
        backgroundColor: AppColor.primary,
      ),
      body: teamMembers.isEmpty
          ? Center(child: Text('Tidak ada anggota tim.'))
          : ListView.builder(
        itemCount: teamMembers.length,
        itemBuilder: (context, index) {
          final member = teamMembers[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text(
                member['name']!.substring(0, 1).toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(member['name']!),
            subtitle: Text(member['nim']!),
          );
        },
      ),
    );
  }
}
