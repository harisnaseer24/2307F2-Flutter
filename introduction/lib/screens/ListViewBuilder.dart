import 'package:flutter/material.dart';

class LearningListViewBuilder extends StatefulWidget {
  const LearningListViewBuilder({super.key});

  @override
  State<LearningListViewBuilder> createState() => _LearningListViewBuilderState();
}

class _LearningListViewBuilderState extends State<LearningListViewBuilder> {
 var phones=[
  {
  "model":"Iphone 16 pro",
  "storage":"512 GB/ 1 TB",
  "price":"\$ 999",
  "image":"https://www.apple.com/v/iphone-14/home/ai/images/meta/og__e2v8j0xq3g6m_og.png",
 },
  {
  "model":"Iphone 15 pro max",
  "storage":"128 GB",
  "price":"\$ 850",
  "image":"https://www.apple.com/v/iphone-14/home/ai/images/meta/og__e2v8j0xq3g6m_og.png",
 },
  {
  "model":"Iphone 13 pro",
  "storage":"256 GB",
  "price":"\$ 750",
  "image":"https://www.apple.com/v/iphone-14/home/ai/images/meta/og__e2v8j0xq3g6m_og.png",
 },
  {
  "model":"Samsung S24 Ultra",
  "storage":"512 GB/ 1 TB",
  "price":"\$ 1199",
  "image":"https://www.apple.com/v/iphone-14/home/ai/images/meta/og__e2v8j0xq3g6m_og.png",
 },
  {
  "model":"Samsung S23",
  "storage":"512 GB/ 1 TB",
  "price":"\$ 899",
  "image":"https://www.apple.com/v/iphone-14/home/ai/images/meta/og__e2v8j0xq3g6m_og.png",
 },
  {
  "model":"Iphone 11",
  "storage":"64 GB",
  "price":"\$ 550",
  "image":"https://www.apple.com/v/iphone-14/home/ai/images/meta/og__e2v8j0xq3g6m_og.png",
 },
  {
  "model":"Iphone 12 mini",
  "storage":"256 GB",
  "price":"\$ 600",
  "image":"https://www.apple.com/v/iphone-14/home/ai/images/meta/og__e2v8j0xq3g6m_og.png",
 },
 
  {
  "model":"Realme 11 ",
  "storage":"512 GB",
  "price":"\$ 449",
  "image":"https://www.apple.com/v/iphone-14/home/ai/images/meta/og__e2v8j0xq3g6m_og.png",
 },


 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Builder"),
        centerTitle: true,
      ),
      body: 
      Center(
       child: ListView.builder(
          itemBuilder:(context,index){
          return
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: 
             ListTile(
              title:Text(phones[index]["model"].toString()),
              subtitle: Text(phones[index]["storage"].toString()),
              leading: Icon(Icons.phone_android),
              trailing: Text(phones[index]["price"].toString()),
              ),
           );
        } ,
          itemCount: phones.length,
          )

      ),
    );
  }
}