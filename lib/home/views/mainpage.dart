import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kraftnightt/components/textfield.dart';
import 'package:kraftnightt/home/controller/controller.dart';
import 'package:kraftnightt/home/models/itenary.dart';

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
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Where do ",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "you want to go?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    Icon(Icons.person)
                  ],
                ),
                SizedBox(
                  height: height / 20,
                ),
                textField("discover a city", Icons.search, false, scontroller,
                    TextInputType.name),
                SizedBox(
                  height: height / 20,
                ),
                Row(
                  children: [
                    Text(
                      "Explore Cities",
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
                        return Container(
                            clipBehavior: Clip.hardEdge,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            margin: EdgeInsets.all(10),
                            height: height / 20,
                            // width: width / 4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                    colors: [Colors.blue, Colors.grey]),
                                border: Border.all(color: Colors.blue)),
                            child: InkWell(
                                onTap: () {
                                  controller1.selected.value = items[index];
                                  controller1.filterItems(itineraries);

                                  print(controller1.selected.value);
                                },
                                child: Center(child: Text(items[index]))));
                      }),
                ),
                SizedBox(
                  height: height / 5,
                  child: ListView.builder(
                      itemCount: 0, itemBuilder: (context, index) {}),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
