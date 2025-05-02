import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
const MyDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Drawer(

      child: ListView(
        children: [
          DrawerHeader(child:
          ListView(
            children: [
              // pic
              Container(
                // height: 128,
                // width: 128,
                // color: Colors.red,
                child:
                 Expanded(
                   child: CircleAvatar(
                    backgroundColor: Colors.white,
                    
                    child: 
                     Image.network("image link",
                    width: 80,
                    // height: 100,
                    ),
                                   ),
                 )
                
              ),
              
              // name
              Text("Haris Naseer")
            ],
          )
          
          
          ),
          ListTile(
            title: Text("Orders"),
            leading: Icon(Icons.monetization_on),
          ),
           ListTile(
            title: Text("Products"),
            leading: Icon(Icons.shopify),
          ),
           GestureDetector(
            onTap: (){
              Navigator.pushNamed(context,"/api" );
            },
             child: ListTile(
              title: Text("API Products"),
              leading: Icon(Icons.settings),
              subtitle: Text("customize your experience"),
              trailing: Icon(Icons.edit),
              
                       ),
           ),
           ListTile(
            title: Text("Logout"),
            leading: Icon(Icons.login),
          ),
        ],
      ),
    );
  }
}