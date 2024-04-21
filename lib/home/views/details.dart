import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class DetailPage extends StatelessWidget {
  String? name;
  DetailPage({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: [
            Container(
              height: height / 2,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: height / 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // border: Border.all(color: Colors.red),
                        image: const DecorationImage(
                          image: AssetImage('lib/asets/img1.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    Text(
                      name == null ? "No mane" : name!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("start_date"),
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.black),
                                onPressed: () {},
                                child: Text("25 sep 2023"))
                          ],
                        ),
                        Column(
                          children: [
                            Text("end_date"),
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.black),
                                onPressed: () {},
                                child: Text("25 sep 2023"))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height / 20,
            ),
            Container(
                width: double.infinity,
                child: OutlinedButton(
                    style:
                        OutlinedButton.styleFrom(foregroundColor: Colors.black),
                    onPressed: () {},
                    child: Text("start a poll..."))),
            SizedBox(
              height: height / 20,
            ),
            Text("add photos.."),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.all(10),
                        height: 100,
                        width: 100, // Set your desired height
                        child: DottedBorder(
                          color: Colors.black, // Set your border color
                          strokeWidth: 1, // Set the width of the border
                          dashPattern: [
                            5,
                            5
                          ], // Set the pattern of the dots (5 pixels drawn, 5 pixels space)
                          borderType: BorderType
                              .Rect, // Set the border type (Rect, RRect, or Circle)
                          child: Center(child: Icon(Icons.add)),
                        ));
                  }),
            )
          ],
        ),
      )),
    );
  }
}
