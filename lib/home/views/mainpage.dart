import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kraftnightt/addItenary/add.dart';
import 'package:kraftnightt/calender/calendar.dart';
import 'package:kraftnightt/components/textfield.dart';
import 'package:kraftnightt/home/controller/controller.dart';
import 'package:kraftnightt/home/models/itenary.dart';
import 'package:kraftnightt/home/views/details.dart';
import 'package:kraftnightt/home/views/profile.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  homecontroller controller1 = Get.put(homecontroller());
  @override
  Widget build(BuildContext context) {
    List<String> items = ['All', 'personnal', 'recommendation', 'friends'];

    TextEditingController scontroller = TextEditingController();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        Text(
                          "Plan your path",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "where to next?",
                          style: TextStyle(
                            fontFamily: 'Azonix',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(() => const ProfileScreen());
                        },
                        child: const Icon(Icons.person))
                  ],
                ),
                SizedBox(
                  height: height / 20,
                ),
                textField("discover", Icons.search, false, scontroller,
                    TextInputType.name),
                SizedBox(height: 30),
                const Row(
                  children: [
                    Text(
                      "Explore ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: height / 15,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // controller1.selecteditems.clear();
                            controller1.selected.value = items[index];
                            controller1.filterItems(itineraries);
                            // print(itineraries);

                            print(controller1.selected.value);
                          },
                          child: Container(
                              clipBehavior: Clip.hardEdge,
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              margin: const EdgeInsets.all(10),
                              height: height / 20,
                              // width: width / 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: const LinearGradient(colors: [
                                    Color.fromARGB(255, 232, 236, 240),
                                    Colors.white
                                  ]),
                                  border: Border.all(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      width: 2)),
                              child: Center(child: Text(items[index]))),
                        );
                      }),
                ),
                Obx(
                  () => SizedBox(
                    height: height / 3,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const ScrollPhysics(),
                        itemCount: controller1.selecteditems.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => DetailPage(
                                  name: controller1.selecteditems[index].name));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              height: height / 4,
                              width: width / 2,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    const BoxShadow(
                                        blurRadius: 5, color: Colors.grey)
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color:
                                          const Color.fromARGB(255, 16, 16, 16),
                                      width: 2)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 40, left: 10, right: 10, top: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      height: height / 5,
                                      width: width / 2,
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                'lib/asets/img1.jpg'),
                                            fit: BoxFit
                                                .cover, // Adjust this based on your requirements
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 236, 234, 238))),
                                    ),
                                    Text(controller1.selecteditems[index].name
                                        .toString())
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: height / 20,
                ),
                SwipeButton.expand(
                  thumb: Icon(
                    Icons.double_arrow_rounded,
                    color: Colors.white,
                  ),
                  child: Text(
                    "Plan your day",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  activeThumbColor: Colors.grey[600],
                  activeTrackColor: Colors.grey.shade300,
                  onSwipe: () {
                    Get.to(() => MyApp1());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
