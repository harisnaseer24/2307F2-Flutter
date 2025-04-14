import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({ Key? key }) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("This is test page"),
      ) ,
      body: 
      Center(
        child: 
       Container(
       
          height: 200,
          width: 200,
          color: Colors.black,
           child: Text("this is test body",style: TextStyle(
          color: const Color.fromARGB(255, 0, 54, 179),
          fontSize: 35,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.italic,
          backgroundColor: Colors.amberAccent
          ),
          ),

       )
      )
      
    );
  }
}
