import 'package:flutter/material.dart';
import './calendar_widget.dart';
import './event_editing_page.dart';
import 'package:provider/provider.dart';
import './event_provider.dart';

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black, primaryColor: Colors.green),
        home: MainPage1(),
      ));
}

class MainPage1 extends StatelessWidget {
  const MainPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const CalendarWidget(),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add, color: Colors.white),
            backgroundColor: Colors.red,
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EventEditingPage()))),
      ),
    );
  }
}
