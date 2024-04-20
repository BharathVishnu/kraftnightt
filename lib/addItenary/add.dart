import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class EventRegistrationPage extends StatefulWidget {
  @override
  _EventRegistrationPageState createState() => _EventRegistrationPageState();
}

class _EventRegistrationPageState extends State<EventRegistrationPage> {
  late TextEditingController _eventNameController;
  late TextEditingController _cityController;
  late TextEditingController _venueController;
  late TextEditingController _moreInfoController;
  late TextEditingController _artistsController;
  late TextEditingController _eventRateController;
  late TextEditingController _accountHolderNameController;
  late TextEditingController _bankNameController;
  late TextEditingController _accountNumberController;
  late TextEditingController _bankIFSCController;

  DateTime? _startDate;
  DateTime? _endDate;
  DateTime? _startTime;
  DateTime? _endTime;

  var pickedFile;

  @override
  void initState() {
    super.initState();
    _eventNameController = TextEditingController();
    _cityController = TextEditingController();
    _venueController = TextEditingController();
    _moreInfoController = TextEditingController();
    _artistsController = TextEditingController();
    _eventRateController = TextEditingController();
    _accountHolderNameController = TextEditingController();
    _bankNameController = TextEditingController();
    _accountNumberController = TextEditingController();
    _bankIFSCController = TextEditingController();
  }

  @override
  void dispose() {
    _eventNameController.dispose();
    _cityController.dispose();
    _venueController.dispose();
    _moreInfoController.dispose();
    _artistsController.dispose();
    _eventRateController.dispose();
    _accountHolderNameController.dispose();
    _bankNameController.dispose();
    _accountNumberController.dispose();
    _bankIFSCController.dispose();
    super.dispose();
  }

  // Function to handle image selection
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      this.pickedFile = pickedFile;
    });
  }

  // Function to handle form submission
  void submitForm() {
    // Add your form submission logic here
    // You can access form fields using their controllers
    // For example, _eventNameController.text contains the value of Event Name field
    // You can also handle image upload if required
    // Access the selected image path using pickedFile.path
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADD ITENARY'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text('EVENT INFO',
              //     style:
              //         TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 10.0),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 293, // Set the width to the desired value
                  height: 150, // Set the height to the desired value
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: pickedFile != null
                      ? Image.file(
                          File(pickedFile!.path),
                          fit: BoxFit.cover,
                        )
                      : Icon(Icons.add_photo_alternate),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _eventNameController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 10.0),
              SizedBox(height: 10.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Interests',
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                ),
                items: ['food', 'travel', 'others'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {});
                },
              ),
              SizedBox(height: 20.0),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ElevatedButton(
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2025),
                    );
                    if (picked != null) {
                      setState(() {
                        _startDate = picked;
                      });
                    }
                  },
                  child: Text('Select Start Date'),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        _startTime = DateTime(
                            _startDate!.year,
                            _startDate!.month,
                            _startDate!.day,
                            picked.hour,
                            picked.minute);
                      });
                    }
                  },
                  child: Text('Select Start Time'),
                ),
              ]),
              SizedBox(height: 10.0),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ElevatedButton(
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2025),
                    );
                    if (picked != null) {
                      setState(() {
                        _endDate = picked;
                      });
                    }
                  },
                  child: Text('Select End Date'),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        _endTime = DateTime(_endDate!.year, _endDate!.month,
                            _endDate!.day, picked.hour, picked.minute);
                      });
                    }
                  },
                  child: Text('Select End Time'),
                ),
              ]),
              SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Types',
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                ),
                items: ['friends', 'public', 'private'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {});
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _moreInfoController,
                maxLines: 5, // Set the maximum number of lines
                decoration: InputDecoration(
                  labelText: 'More Info',
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 20.0), // Adjust vertical padding as needed
                ),
              ),

              SizedBox(height: 10.0),

              SizedBox(height: 20.0),
              Center(
                child: SizedBox(
                  width: 330,
                  height: 60,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      submitForm();
                    },
                    child: Text(
                      'PROCEED',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
