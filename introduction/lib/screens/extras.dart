import 'package:flutter/material.dart';
import 'package:introduction/components/myAppbar.dart';
import 'package:introduction/components/myDrawer.dart';

class Extras extends StatefulWidget {
   Extras({super.key});

  @override
  State<Extras> createState() => _ExtrasState();
}

class _ExtrasState extends State<Extras> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

appBar:
AppBar(
  title: Text("HCom"),
  centerTitle: true,
  // leading: Icon(Icons.abc),
  actions: [
    IconButton(onPressed: (){
      Navigator.pushNamed(context,"/signup");
    }, icon: Icon(Icons.person)),
    IconButton(onPressed: (){
      Navigator.pushNamed(context,"/product");
    }, icon: Icon(Icons.shopify_outlined)),
    IconButton(onPressed: (){
      Navigator.pushNamed(context,"/list");
    }, icon: Icon(Icons.list)),

     IconButton(onPressed: (){
      Navigator.pushNamed(context,"/listviewbuilder");
    }, icon: Icon(Icons.menu)),
  ],
),
 drawer: MyDrawer(),

      body: Center(
        child: 
        Stack(
          alignment:Alignment.bottomCenter,
          children: [
            Container(
          height: 100,
          width: 100,
          color: Colors.red,
          child: Icon(Icons.favorite),
        ),
        SizedBox(height: 12,),
        Container(
          height: 80,
          width: 80,
          color: Colors.green,
          child: Icon(Icons.shop),
        ),
        SizedBox(height: 12,),
        Container(
          height: 60,
          width: 60,
          color: Colors.yellow,
          child: Icon(Icons.thumb_down),
        ),
        SizedBox(height: 12,),
        Container(
          height: 40,
          width: 40,
          color: Colors.blue,
          child: Icon(Icons.search),
        ), 
        SizedBox(height: 12,),
         Container(
          height: 20,
          width: 20,
          color: Colors.purple,
          child: Icon(Icons.search),
        ), 
       
          ],

      )),
    );
  }
}