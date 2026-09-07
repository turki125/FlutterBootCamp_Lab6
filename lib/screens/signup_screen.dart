import 'package:day12_introduction_to_databsae/screens/login_screen.dart';
import 'package:day12_introduction_to_databsae/service/database.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordConroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade500,
        title: Text("Sign up",style: TextStyle(
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
                 Text("Already have an account?"),
                TextButton(
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),),(route) => false,);
                  }, child: Text("log in")),
              ],
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                await Database().signupUser(
                  email: emailController.text,
                  password: passwordConroller.text,
                );
              },
              child: Text("Sign up",
                style: TextStyle(
                  color: Colors.blueGrey,
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