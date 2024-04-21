import 'package:flutter/material.dart';

class TravelPreferencesSlider extends StatefulWidget {
  @override
  _TravelPreferencesSliderState createState() =>
      _TravelPreferencesSliderState();
}

class _TravelPreferencesSliderState extends State<TravelPreferencesSlider> {
  // Define your list of preferences
  List<String> preferences = ['Food', 'Adventure', 'Peace', 'outskirts'];

  // Map to store preference values
  Map<String, double> preferenceValues = {
    'Food': 0.0,
    'Adventure': 0.0,
    'Peace': 0.0,
    'outskirts': 0.0,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: preferences.map((preference) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(preference, style: TextStyle(fontSize: 16.0)),
              Slider(
                value: preferenceValues[preference] ?? 0.0,
                min: 0.0,
                max: 100.0,
                divisions: 100,
                onChanged: (value) {
                  setState(() {
                    preferenceValues[preference] = value;
                  });
                },
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
