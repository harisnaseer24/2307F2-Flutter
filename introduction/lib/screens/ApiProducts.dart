import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:introduction/components/myDrawer.dart';
import 'package:http/http.dart' as http;

class ApiProducts extends StatefulWidget {
  const ApiProducts({ Key? key }) : super(key: key);

  @override
  _ApiProductsState createState() => _ApiProductsState();
}

class _ApiProductsState extends State<ApiProducts> {

  Future<void> getProducts() async{

var url=Uri.parse('https://dummyjson.com/products');

  var response=await http.get(url);//stop
  //request.body post req
  // response.body get req
  print(response.body);
  return jsonDecode(response.body);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      drawer:MyDrawer(),
      body: FutureBuilder(
       future: getProducts() ,
       builder: (context,snapshot){

      //  if (snapshot.connectionState == ConnectionState.active) {
          if(snapshot.hasData){

             var data = snapshot.data as Map<String, dynamic>;//explicit
              var products = data['products'] as List<dynamic>;
          return ListView.builder(itemBuilder: (context,index){
            return ListTile(
              title: Text(products[index]['title']),
              subtitle: Text(products[index]['price'].toString()),
              trailing: Text(products[index]['category']),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(products[index]['thumbnail']),
              ),
            );

          },itemCount: products.length,);

        }else{
          return
          CircularProgressIndicator();
        }
      //  } else {
      //    return Center(child: Text("Failed to load data"),);
      //  }

       }, 

      ),
    );
  }
}