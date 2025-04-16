import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _signupKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Container(
              height: 700,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      width: 1, color: Colors.grey, style: BorderStyle.solid)),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    key: _signupKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Create an account..",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 32,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Username",
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.person_2),
                              hintText: "enter username"),
                        ),
                        // email
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Email",
                              prefixIcon: Icon(Icons.mail),
                              border: OutlineInputBorder(),
                              hintText: "enter email"),
                        ),

                        //password
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon: Icon(Icons.password),
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.remove_red_eye),
                              hintText: "enter password"),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        // submit button
                        ElevatedButton(
                            onPressed: () {
                              print("User added succesfully");
                            },
                            child: Text("Sign up"))

                        // TextField()
                      ],
                    ),
                  )))),
      // drawer: ,
      // bottomNavigationBar: ,
    );
  }
}
