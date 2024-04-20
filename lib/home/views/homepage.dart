import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kraftnightt/home/controller/controller.dart';
import 'package:kraftnightt/home/views/Calander.dart';
import 'package:kraftnightt/home/views/mainpage.dart';
import 'package:kraftnightt/home/views/profile.dart';
import 'package:kraftnightt/memoirs/views/memoir.dart';

class HomeScreen extends StatelessWidget {
  final homecontroller controller = Get.put(homecontroller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<homecontroller>(builder: (controller) {
      return Scaffold(
        // backgroundColor: Colors.white,
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              /* Replace YourHomeWidget() with the actual widget you want to display */

              Calender(),
              Memoirs(),
              MainPage(),
              ProfileScreen()
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10),
          child: GNav(
            tabBackgroundGradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(255, 243, 58, 33),
                Colors.grey.withOpacity(.5),
              ],
            ),
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 15,
            ),
            duration: const Duration(milliseconds: 400),
            // tabBackgroundColor: Colors.grey[100]!,
            color: Colors.black,
            // rippleColor: Colors.green.withOpacity(.1),
            onTabChange: controller.changeTabIndex,
            // gap: 8,
            // backgroundColor: Color.fromARGB(255, 0, 0, 0).withOpacity(1),
            // tabBorderRadius: 10.0,
            tabs: [
              GButton(
                iconActiveColor: Colors.white,
                text: "Medical Info",
                // iconActiveColor: Colors.green,
                icon: Icons.more_vert,
              ),
              GButton(
                iconActiveColor: Colors.white,
                text: "itenair",
                // iconActiveColor: Colors.green,
                icon: Icons.more_vert,
              ),
              GButton(
                iconActiveColor: Colors.white,
                text: "Home",
                // iconActiveColor: Colors.green,
                icon: Icons.home,
              ),
              GButton(
                iconActiveColor: Colors.white,
                text: "Profile",
                // iconActiveColor: Colors.green,
                icon: Icons.person,
              ),
            ],
          ),
        ),
      );
    });
  }
}
