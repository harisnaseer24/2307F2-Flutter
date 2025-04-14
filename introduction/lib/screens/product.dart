import 'package:flutter/material.dart';
import 'package:introduction/screens/listview.dart';

class Product extends StatefulWidget {
  const Product({ Key? key }) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Our Products"),),
      body:Center(
        child: Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black,width: 2,style:BorderStyle.solid)
          // color: const Color.fromARGB(255, 238, 39, 39),
          ),
          height: 400,
          width: 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Image.network("imagelink"
                ,height: 200,
                // width: double.infinity,
                fit: BoxFit.cover,
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Lenovo ThinkPad V14" ,style:TextStyle(fontSize: 18, color: const Color.fromARGB(255, 48, 47, 47)),),
                    Text("\$ 500",style:TextStyle(fontSize: 18, color: const Color.fromARGB(255, 48, 47, 47)) ),
                  ],
                ),
                SizedBox(height: 15,),
                Text("Everyday tasks are quickly handled with ease using up to 12th Gen Intel® Core™ Processors."
                ,style:TextStyle(fontSize: 12, color: const Color.fromARGB(255, 131, 130, 130)) ,
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    ElevatedButton(onPressed: (){}, child: Text("Add to Cart",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 11, 104, 98),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),),

                    SizedBox(width: 10,),
                     ElevatedButton(onPressed: (){
                      
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ListviewLearning()));

                     }, child: Text("Show Details",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 11, 104, 98),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),),
                  ],
                ),
            
              ],),
          ),
        ),
      ),
    );
  }
}