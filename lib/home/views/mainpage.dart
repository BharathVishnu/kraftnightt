import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
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
                  height: height / 10,
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
                              padding: EdgeInsets.only(left: 10, right: 10),
                              margin: EdgeInsets.all(10),
                              height: height / 20,
                              // width: width / 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                      colors: [Colors.blue, Colors.grey]),
                                  border: Border.all(color: Colors.blue)),
                              child: Center(child: Text(items[index]))),
                        );
                      }),
                ),
                Obx(
                  () => SizedBox(
                    height: height / 3,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: ScrollPhysics(),
                        itemCount: controller1.selecteditems.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(5),
                            height: height / 4,
                            width: width / 2,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(blurRadius: 5, color: Colors.grey)
                                ],
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 12, 12, 12))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 40, left: 10, right: 10, top: 10),
                              child: Column(
                                children: [
                                  Container(
                                    height: height / 5,
                                    width: width / 2,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image:
                                              AssetImage('lib/asets/img1.jpg'),
                                          fit: BoxFit
                                              .cover, // Adjust this based on your requirements
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 236, 234, 238))),
                                  ),
                                  Text(controller1.selecteditems[index].name
                                      .toString())
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
