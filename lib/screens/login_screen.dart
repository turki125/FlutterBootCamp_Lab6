import 'package:day12_introduction_to_databsae/screens/home_screen.dart';
import 'package:day12_introduction_to_databsae/screens/signup_screen.dart';
import 'package:day12_introduction_to_databsae/service/database.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordConroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("Log in",style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController ,
             decoration: InputDecoration(
              label: Text("Email"),
              hintText: "Enter Your email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueGrey
                )
              ),
             ),
            ),
            SizedBox(height: 24),
            TextField(
              controller:  passwordConroller,
             decoration: InputDecoration(
              label: Text("Password"),
              hintText: "Enter Your password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blueGrey)
              ),
             ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text("Don't have an account?"),
                TextButton(
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignupScreen(),),(route) => false,);

                  }, child: Text("Sign up")),
              ],
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
              },
              child: Text("Sign up",
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}