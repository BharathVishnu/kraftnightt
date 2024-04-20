import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  late TextEditingController _titleController;
  late TextEditingController _descController;

  DateTime? _startDate;
  DateTime? _endDate;
  DateTime? _startTime;
  DateTime? _endTime;

  var pickedFile;

  String _category = "";

  String _visible = "";

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();

    super.dispose();
  }

  // Function to upload image and get URL
  Future<String?> uploadImage() async {
    if (pickedFile != null) {
      final filePath = pickedFile.path;
      final fileName = basename(filePath);
      final storageRef = FirebaseStorage.instance.ref().child('images');
      final reference = storageRef.child(fileName);
      final task = reference.putFile(File(filePath));
      final snapshot = await task.whenComplete(() => null);
      final url = await snapshot.ref.getDownloadURL();
      return url;
    } else {
      return null;
    }
  }

  void resetFields() {
    _titleController.clear();
    _descController.clear();
  }

  // Function to handle form submission
  Future<void> submitForm() async {
    // Upload image if selected
    String? imageUrl;
    if (pickedFile != null) {
      imageUrl = await uploadImage();
    }

    // Combine the date and time values to create DateTime objects
    DateTime combinedStartDateTime = _startDate!.add(
      Duration(hours: _startTime!.hour, minutes: _startTime!.minute),
    );

    DateTime combinedEndDateTime = _endDate!.add(
      Duration(hours: _endTime!.hour, minutes: _endTime!.minute),
    );

    // Convert the DateTime objects to Timestamp objects
    Timestamp startTimestamp = Timestamp.fromDate(combinedStartDateTime);
    Timestamp endTimestamp = Timestamp.fromDate(combinedEndDateTime);

    final eventId = DateTime.now().millisecondsSinceEpoch.toString();

    final eventData = {
      'image_url': imageUrl,
      'title': _titleController.text,
      'category': _category,
      'start': startTimestamp,
      'email': "test@gmail.com",
      'end': endTimestamp,
      'visible': _visible,
      'description': _descController.text,
    };

    try {
      await FirebaseFirestore.instance.collection('itenary').add(eventData);

      getSuccessSnackBar("Event added successfully");
      resetFields();
    } catch (e) {
      getErrorSnackBarNew("Failed to add the event");
    }
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
              SizedBox(height: 10.0),
              GestureDetector(
                onTap: () async {
                  final picker = ImagePicker();
                  pickedFile =
                      await picker.pickImage(source: ImageSource.gallery);
                },
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
                controller: _titleController,
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
                  setState(() {
                    _category = value!;
                  });
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
                  setState(() {
                    _visible = value!;
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _descController,
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

  getSuccessSnackBar(String message) {
    Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  getErrorSnackBarNew(String message) {
    Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }
}
