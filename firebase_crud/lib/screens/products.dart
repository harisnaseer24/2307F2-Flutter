import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_crud/screens/productDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class Products extends StatefulWidget {
  const Products({ Key? key }) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  var products= FirebaseFirestore.instance.collection('products');
TextEditingController searchController=TextEditingController();

// delete product function
void deleteProduct(String id)async{
  print(id);
try {
  await products.doc(id).delete();
  print("Product deleted");
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text("Product deleted"),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.red,
  ));
} catch (e) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(e.toString()),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.red,
  ));
}
}

void editProduct(productDetails){

showDialog(context: context, builder: (context){
 TextEditingController titleController=TextEditingController(text: productDetails['title']);
  TextEditingController desController=TextEditingController(text: productDetails['description']);
  TextEditingController priceController=TextEditingController(text: productDetails['price'].toString());

  String imgUrl=productDetails['image'];

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

return AlertDialog(
  
  title: Text("Edit product : ${productDetails['title']}"),
  content: 
  // edit form
   Center(
          child: Column(
            mainAxisSize:MainAxisSize.min,
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
             Image.memory(base64Decode(imgUrl),height:100)
                       
            ],
          ),
        ),

  actions: [
    ElevatedButton(onPressed: (){
Navigator.pop(context);
    }, child: Text("Cancel")),
     ElevatedButton(onPressed: () {
                  // Add the product to the database
                  products.doc(productDetails['id']).update({
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
                    Text("Product Updated successfully..✔",style: TextStyle(color: Colors.white),), backgroundColor: Colors.purple,)) ,

                    Navigator.pop(context),
                  }).catchError((error) => {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to add product"),))
                  });
                }, child: Text("Update")),

  ]

);

});

// try {
  
// } catch (e) {
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     content: Text(e.toString()),
//     duration: Duration(seconds: 2),
//     backgroundColor: Colors.red,
//   ));
// }
}

// search products function

searchProducts()async{
  String query= searchController.text.trim().toLowerCase();
  if(query.isEmpty){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Please enter a search query"),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
    return;
  }else{

var searchResult= await products
                        .where('title', isEqualTo: query)
                        // .where('description', isEqualTo: query)
                        .get();
                        print(searchResult.docs);

  }


}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, "/add");
          }, icon: Icon(Icons.add))
        ],
      ),
      body: ListView(   
      children: [
      
      Row(
  children: [
    Expanded(
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(labelText: "Type to search products"),
      ),
    ),
    SizedBox(width: 8),
    ElevatedButton(
      onPressed: () {
        searchProducts();
      },
      child: Text("Search"),
    ),
  ],
),
        StreamBuilder(stream: products.snapshots(), builder: (context,snapshot){
          if(snapshot.hasData){
            var productList= snapshot.data!.docs;
        
        return ListView.builder(itemCount:productList.length , itemBuilder:(context, index){
        
        Map<String,dynamic> productDetails={
          'id':productList[index].id,
          'title':productList[index]['title'],
          'description':productList[index]['description'],
          'price':productList[index]['price'],
          'image':productList[index]['image'],
        };
        
        
        
        return ListTile(
          title: Text(productList[index]['title']),
          subtitle: Text(productList[index]['description']),
        leading: CircleAvatar(
                      child: Image.memory(base64Decode(productList[index]['image']),height: 40,),)
                   ,
        trailing:Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: (){
        
        
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailScreen(productDetails)));
        
            }, icon: Icon(Icons.info)),
            IconButton(onPressed: (){
        editProduct(productDetails);
        
            }, icon: Icon(Icons.edit,color: Colors.blue,)),
            IconButton(onPressed: (){
        
        deleteProduct(productList[index].id);
        
            }, icon: Icon(Icons.delete,color: Colors.red,)),
          ],
        ),
        );
        });
          }else{
            return CircularProgressIndicator();
          }
        
        }),
      ],
            ),
      
    );
  }
}