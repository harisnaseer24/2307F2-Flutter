import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Products extends StatefulWidget {
  const Products({ Key? key }) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  var products= FirebaseFirestore.instance.collection('products').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: StreamBuilder(stream: products, builder: (context,snapshot){
        if(snapshot.hasData){
          var productList= snapshot.data!.docs;
return ListView.builder(itemCount:productList.length , itemBuilder:(context, index){
return ListTile(
  title: Text(productList[index]['title']),
  subtitle: Text(productList[index]['description']),
leading: CircleAvatar(
                    child: Image.network(productList[index]['image'],height: 40,),)
                 ,
trailing:Text(productList[index]['price'].toString()),
);
});
        }else{
          return CircularProgressIndicator();
        }

      })),
      
    );
  }
}