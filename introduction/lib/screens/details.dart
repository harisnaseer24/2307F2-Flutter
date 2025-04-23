import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var user = {"name": "Haris Naseer", "age": 54, "city": "Karachi"};
  String name = "Haris";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("User Details"),
            /// Interpolation
            Text("Name : MR. ${user["name"]} "),
            Text("City : ${user["city"]}"),
            Text("Age : ${user["age"]} years old"),
            ElevatedButton(
                onPressed: () {
                  print("Before : ${ user["name"]}");
                  setState(() {
                     user["name"] = "Sir Haris Naseer";
                  });
                  print("After : ${ user["name"]}");
                },
                child: Text("Change Name"))
          ],
        ),
      ),
    );
  }
}
