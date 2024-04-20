import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ItenaryBox extends StatelessWidget {
  final String backgroundImagePath;
  final String text1;
  final String text2;

  const ItenaryBox({
    Key? key,
    required this.backgroundImagePath,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        width: 320,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Make the container rounded
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 9), // changes position of shadow
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(
                "https://firebasestorage.googleapis.com/v0/b/doorcode-23c79.appspot.com/o/images%2F1000126316.jpg?alt=media&token=fa768ec4-c850-4bdc-95d8-6052ae6d63af"), // Set background image
            fit: BoxFit.cover, // Cover the entire container
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                10), // Match the container's border radius
            color: Colors.black
                .withOpacity(0.5), // Semi-transparent black background
          ),
          child: Padding(
            padding: const EdgeInsets.all(22.0), // Add padding for the text
            child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the left
                children: [
                  Text(
                    text1,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(height: 20),
                  Text(
                    text2,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                ]),
          ),
        ),
      ),
    );
  }
}