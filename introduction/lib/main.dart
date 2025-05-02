import 'package:flutter/material.dart';
import 'package:introduction/screens/ApiProducts.dart';
import 'package:introduction/screens/ListViewBuilder.dart';
import 'package:introduction/screens/details.dart';
import 'package:introduction/screens/extras.dart';
import 'package:introduction/screens/listview.dart';
import 'package:introduction/screens/product.dart';
import 'package:introduction/screens/signup.dart';
import 'package:introduction/test.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Introduction',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 11, 104, 98)),
        useMaterial3: true,
      ),
      home:Extras(),
      routes: {
        "/signup": (context)=>Signup(),
        "/product": (context)=>Product(),
        "/list": (context)=>ListviewLearning(),
        "/listviewbuilder":(context)=> LearningListViewBuilder(),
        "/api":(context)=> ApiProducts(),
      },
    );
  }
}

