import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kraftnightt/memoirs/iternary.dart';

class Memoirs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 12, bottom: 8.0, top: 8.0),
          child: Center(
            child: Text(
              'MEMOIRS',
              style: TextStyle(
                  fontFamily: 'Azonix', color: Colors.black, fontSize: 32),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        centerTitle: false,
        elevation: 4,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('memoirs').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final memoirsDocs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: memoirsDocs.length,
            itemBuilder: (context, index) {
              final memoirData =
                  memoirsDocs[index].data() as Map<String, dynamic>;
              return Column(
                children: [
                  const SizedBox(height: 20),
                  ItenaryBox(
                    backgroundImagePath: "",
                    text1: memoirData['title'] ?? '',
                    text2: memoirData['date'] ?? '',
                  ),
                  const SizedBox(height: 24),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
