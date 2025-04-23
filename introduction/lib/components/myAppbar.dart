import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget {


  @override
  Widget build(BuildContext context){
    return AppBar(
      title: Text("HCom"),
  centerTitle: true,
  leading: Icon(Icons.abc),
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
  ],
    );
  }
}