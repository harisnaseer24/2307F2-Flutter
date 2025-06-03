import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Addproduct extends StatefulWidget {
  const Addproduct({ Key? key }) : super(key: key);

  @override
  _AddproductState createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
 CollectionReference products= FirebaseFirestore.instance.collection('products');
  TextEditingController titleController=TextEditingController();
  TextEditingController desController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  // TextEditingController imageController=TextEditingController();
  String imgUrl="";
  final ImagePicker picker = ImagePicker();
getImage()async{
    // final ImagePicker picker = ImagePicker();
final XFile? image = await picker.pickImage(source: ImageSource.gallery);

final Uint8List byteImage=await image!.readAsBytes();
//image--> [12,121,25454,2187,88785,854577,4,4,878,45,4,.....]
print(byteImage);
//base 64 algorithm
final String base64img=base64Encode(byteImage);
print(base64img);
setState(() {
  imgUrl=base64img;
});
}
var userDetails={};

getUserDetails()async{
   // super.initState();
     final SharedPreferences prefs = await SharedPreferences.getInstance();
String email = prefs.getString("email")?? "";
String username = prefs.getString("username")?? "";
String id = prefs.getString("id")?? "";

setState((){
  userDetails={
    "email":email,
    "username":username,
    "id":id,
  };
});

}

void initState() {
  
getUserDetails();
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Add new product as ${userDetails["email"]}"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context,"/add");
            }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: ListView(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "Title",
                  hintText: "Enter the title of the product",
                ),
              ),
              TextField(
                controller: desController,
                decoration: InputDecoration(
                  labelText: "Description",
                  hintText: "Enter the description of the product",
                ),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: "Price",
                  hintText: "Enter the price of the product",
                ),
              ),
             ElevatedButton(onPressed:
             (){
              getImage();
             }
             , child: Text("Choose File")),
                        ElevatedButton(
                onPressed: () {
                  // Add the product to the database
                  products.add({
                    'title':titleController.text,
                    'description':desController.text,
                    'price':double.parse(priceController.text),
                    'image':imgUrl,
                    
                  }).then((value) => {
                    titleController.clear(),
                    desController.clear(),
                    priceController.clear(),
                   
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: 
                    Text("Product added successfully..✔",style: TextStyle(color: Colors.white),), backgroundColor: Colors.purple,)) ,

                    Navigator.pop(context),
                  }).catchError((error) => {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to add product"),))
                  });
                },
                child: Text("Add product"),
              ),
            ],
          ),
        ),
      )
      ,
    );
  }
}