import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kraftnightt/home/views/slider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              // // actions: [
              // //   IconButton(

              // //       onPressed: () {
              // //         Get.back();
              // //         // Handle back arrow press
              // //       })
              // ],
              ),
          body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  height: height / 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      size: 50,
                    )
                  ],
                ),
                Text(
                  "ank@gmail.com",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '+91 9746195665',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: height / 20,
                ),
                Text(
                  "add your interests",
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(15)),
                    child: TravelPreferencesSlider())
              ],
            ),
          )),
    );
  }
}
