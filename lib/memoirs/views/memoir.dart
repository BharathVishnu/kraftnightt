import 'package:flutter/material.dart';
import 'package:kraftnightt/memoirs/iternary.dart';

class Memoirs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dummyData = [
      {
        'image_url': 'assets/image1.jpg',
        'event_name': 'Event 1',
        'date_from': DateTime(2024, 4, 21),
        'venue': 'Venue 1',
      },
      {
        'image_url': 'assets/image2.jpg',
        'event_name': 'Event 2',
        'date_from': DateTime(2024, 4, 22),
        'venue': 'Venue 2',
      },
      // Add more dummy data as needed
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 8.0),
          child: Text(
            'MEMOIRS',
            style: TextStyle(color: Colors.black, fontSize: 32),
            textAlign: TextAlign.left,
          ),
        ),
        centerTitle: false,
        elevation: 4,
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          final ticketData = dummyData[index];
          return Column(
            children: [
              SizedBox(height: 20),
              ItenaryBox(
                backgroundImagePath: "",
                text1: "Trip to Kodai",
                text2: "23 May 2024",
              ),
              SizedBox(height: 24),
            ],
          );
        },
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';

    return '${_getMonth(date.month)} ${date.day}';
  }

  String _getMonth(int month) {
    switch (month) {
      case 1:
        return 'JAN';
      case 2:
        return 'FEB';
      case 3:
        return 'MAR';
      case 4:
        return 'APR';
      case 5:
        return 'MAY';
      case 6:
        return 'JUN';
      case 7:
        return 'JUL';
      case 8:
        return 'AUG';
      case 9:
        return 'SEP';
      case 10:
        return 'OCT';
      case 11:
        return 'NOV';
      case 12:
        return 'DEC';
      default:
        return '';
    }
  }
}
