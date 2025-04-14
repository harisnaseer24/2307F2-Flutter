import 'package:flutter/material.dart';

class ListviewLearning extends StatefulWidget {
  const ListviewLearning({ Key? key }) : super(key: key);

  @override
  _ListviewLearningState createState() => _ListviewLearningState();
}

class _ListviewLearningState extends State<ListviewLearning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      // body: SingleChildScrollView(
       
      //   child: Column(
      //     children: [
      //       Container(
      //         height: 100,
      //         width: 100,
      //         color: Colors.red,
      //         child: Icon(Icons.favorite),
      //       ),
      //       Container(
      //         height: 100,
      //         width: 100,
      //         color: Colors.green,
      //         child: Icon(Icons.shop),
      //       ),
      //       Container(
      //         height: 100,
      //         width: 100,
      //         color: Colors.yellow,
      //         child: Icon(Icons.thumb_down),
      //       ),
      //       Container(
      //         height: 100,
      //         width: 100,
      //         color: Colors.blue,
      //         child: Icon(Icons.search),
      //       ),  Container(
      //         height: 100,
      //         width: 100,
      //         color: Colors.blue,
      //         child: Icon(Icons.search),
      //       ),  Container(
      //         height: 100,
      //         width: 100,
      //         color: Colors.blue,
      //         child: Icon(Icons.search),
      //       ), 
      //     ],
      //   ),
      // ),

// List View
  body: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: ListView(
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.red,
          child: Icon(Icons.favorite),
        ),
        SizedBox(height: 12,),
        Container(
          height: 100,
          width: 100,
          color: Colors.green,
          child: Icon(Icons.shop),
        ),
        SizedBox(height: 12,),
        Container(
          height: 100,
          width: 100,
          color: Colors.yellow,
          child: Icon(Icons.thumb_down),
        ),
        SizedBox(height: 12,),
        Container(
          height: 100,
          width: 100,
          color: Colors.blue,
          child: Icon(Icons.search),
        ), 
        SizedBox(height: 12,),
         Container(
          height: 100,
          width: 100,
          color: Colors.purple,
          child: Icon(Icons.search),
        ), 
        SizedBox(height: 12,),
        
         Container(
          height: 100,
          width: 100,
          color: Colors.orange,
          child: Icon(Icons.search),
        ), 
      ],
    ),
  ),




    );
  }
}