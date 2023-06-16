import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:poll/login.dart';

class NextPage extends StatelessWidget {
  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:[
            rectangle2View(),
            alreadyHaveAnAccountLoginView(),
          ],),
      )
          ,

    );

  }

  Widget rectangle2View() {
    bool isChecked = false;

    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(40, 42, 44, 46),
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNFcIupXliRUHNFDDBcws6CGfoWdRMpOeYSPJCxSICxQ&s',
              fit: BoxFit.contain,
              alignment: Alignment.topCenter,
              width: 200.0,
              height: 60.0,
            ),
          ),
          buildTextField('Full name', 'Enter Full name',controller: fullnamecontroller,),
          SizedBox(height: 0.0),
          buildTextField('Email address', 'Enter email address', controller: emailcontroller,),
          SizedBox(height: 1.0),
          buildTextField('Password', 'Enter password', obscureText: true, controller: passwordcontroller,),
          SizedBox(height: 1.0),
          buildTextField('Confirm Password', 'Confirm your password', obscureText: true,controller: confirmpasswordcontroller,),
          SizedBox(height: 1.0),
          Row(
            children: [
              SizedBox(height: 10.0,
                child: Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    isChecked = value!;
                  },
                ),
              ),
              Text('I agree to the terms and conditions'),
            ],
          ),
          SizedBox(height: 30.0),
          Container(
            width: 290.0,
            height: 50.0,
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    RegisterUser(fullnamecontroller.text.toString(),
                    emailcontroller.text.toString(),
                    passwordcontroller.text.toString(),
                    confirmpasswordcontroller.text.toString(),);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),

                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 16.0,
                    ),
                  ),
                );
              }
            ),
          ),

        ],
      ),
    );
  }

  Widget buildTextField(String labelText, String hintText, {bool obscureText = false, required TextEditingController controller}) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              labelText,
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          SizedBox(height: 1.0),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: EdgeInsets.all(10.0),
              hintStyle: TextStyle(
                color: Color(0xFF787878),
                fontSize: 14.0,
              ),
            ),
            obscureText: obscureText,
            obscuringCharacter: '*',
          ),
        ],
      ),
    );
  }
}
Widget alreadyHaveAnAccountLoginView() {
  return  RichText(
      text: TextSpan(
        style: TextStyle(
          fontFamily: 'Inter-Medium',
          fontSize: 16.0,
          color: Colors.grey,
        ),
        children: [
          TextSpan(
            text: 'Already have an account?',
          ),
          TextSpan(
            text: 'login',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],

    ),
  );
}

void RegisterUser(String fullname,email,password,confirmpassword) async{
  var url = 'https://pollkaro.com/API_';
  var data ={
    "name": fullname,
    "email":email,
    "password":password,
    "confirm password":confirmpassword
  };
  var body = json.encode(data);
  var uri = Uri.parse(url + "/register.php");
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