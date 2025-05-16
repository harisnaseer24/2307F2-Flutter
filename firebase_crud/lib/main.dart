import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud/screens/addproduct.dart';
import 'package:firebase_crud/screens/products.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';


void main()async {

  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Products(),
      routes: {
        "/add":(context)=>Addproduct(),
      },
    );
  }
}

