import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black.withOpacity(.5),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: 120,
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            // leading: IconButton(
            //   onPressed: () => Navigator.pop(context),
            //   icon: Icon(FontAwesomeIcons.arrowDown),
            // ),
            actions: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.menu),
              ),
            ],
            flexibleSpace: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.05),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: TextField(
                    onEditingComplete: () {},
                    textInputAction: TextInputAction.send,
                    onSubmitted: (msg) {},
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        FontAwesomeIcons.search,
                        color: Colors.black,
                      ),
                      hintText: "Find Friends",
                      contentPadding: EdgeInsets.all(15.0),
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      focusColor: Colors.grey,
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
            ),
            pinned: true,
            title: Text(
              "Add Friends",
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Quick Add",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
          ),
          FutureBuilder(
            future: getAddFriendList(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                final List<Map<String, String>> dummyData = snapshot.data;
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25.0,
                            backgroundColor: Colors.black.withOpacity(.5),
                          ),
                          title: Text(
                            dummyData[index]['username']!,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(dummyData[index]['userID']!),
                          trailing: Container(
                            height: 35.0,
                            width: 80.0,
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.80),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 16.0,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Add",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: dummyData.length,
                  ),
                );
              } else {
                return SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future<List<Map<String, String>>> getAddFriendList() async {
    await Future.delayed(Duration(seconds: 2));
    return _generateDummyData();
  }

  List<Map<String, String>> _generateDummyData() {
    return [
      {"username": "Jimmy john's", "userID": "jimmyjohns"},
      {"username": "BrooklynNets", "userID": "BrooklynNets"},
      {"username": "Billabong", "userID": "bvb09"},
      {"username": "javad", "userID": "jaaa"},
      {"username": "jayadev", "userID": " JD"},
    ];
  }
}
