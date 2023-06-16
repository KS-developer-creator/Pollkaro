import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:poll/main.dart';
import 'package:http/http.dart' as http;
void main()=>runApp(MyApp());
class login extends StatefulWidget {
  const login({super.key});
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void RegisterUser(String fullname,email,password,confirmpassword) async{
    var url = 'https://pollkaro.com/API_';
    var data ={

      "email":email,
      "password":password,

    };
    var body = json.encode(data);
    var uri = Uri.parse(url + "/login.php");
    Response  response = await http.post(
        uri,
        body: body,
        headers: {
          "Content-Type":"application/json"
        }
    );

    var datacheck = jsonDecode(response.body);
    print(datacheck);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNFcIupXliRUHNFDDBcws6CGfoWdRMpOeYSPJCxSICxQ&s',
                fit: BoxFit.contain,
                height: 100.0,
              ),
              SizedBox(height: 20.0),
              Text(
                'Email address',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2.0),
              TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  labelText: 'Enter email address',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14.0)),
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                ' Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 2.0),
              TextFormField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),

                obscureText: true,
              ),
              SizedBox(height: 1.0),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Perform forgot password logic here
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.0),
              ElevatedButton(
                onPressed: () {
                  login();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: GestureDetector(
                  onTap: (){

                  },
                  child: Text(
                    'Log In',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              SizedBox(
                height: 24.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF6D6C6C),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Perform sign-up logic here
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              SizedBox(height: 24.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[ GestureDetector(
                    onTap: () {
                      // Perform skip logic here
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF5E5D5D),
                      ),
                    ),
                  ),
                ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}