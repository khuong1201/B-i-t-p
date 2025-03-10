import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  CheckAgeState createState() => CheckAgeState();
}

class CheckAgeState extends State<MyHomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String message = '';

  void _checkAge() {
    String name = nameController.text;
    int? age = int.tryParse(ageController.text);
    if (age == null) {
      setState(() {
        message = "Chưa nhập tuổi";
      });
      return;
    }

    setState(() {
      if (age < 0) {
        message = "Nhập sai";
      } else if (age >= 2 && age <= 6) {
        message = "Trẻ em";
      } else if (age < 2) {
        message = "Em bé";
      } else {
        message = "Người lớn";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Thực hành 1",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: screenWidth * 0.8,
                child: TextField(
                  controller: nameController,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: 'Họ và Tên',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 14, horizontal: 16),
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: screenWidth * 0.8,
                child: TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: 'Tuổi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 14, horizontal: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: screenWidth * 0.6,
                height: 50,
                child: ElevatedButton(
                  onPressed: _checkAge,
                  child: Text(
                    'Check Tuổi',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                message,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
