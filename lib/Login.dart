import 'dart:ffi';

import 'package:firebase/Homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}
final emailcontroller = TextEditingController();
final passwordcontroller = TextEditingController();
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10,),
                Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(fontSize: 16)
                        ),
                        controller: emailcontroller,
                        style: const TextStyle(fontSize: 20),),
                    )),
                const SizedBox(height: 20,),
                Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                        decoration: const InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(fontSize: 16)
                        ),
                        controller: passwordcontroller,
                        style: const TextStyle(fontSize: 20),),
                    )),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: ()async{
                  try {
                  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailcontroller.text,
                    password: passwordcontroller.text,
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                } catch (e) {
                  print(e);
                }}, child: const Text("Sign up")),
                ElevatedButton(onPressed: ()async{
                  try {
                    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailcontroller.text,
                        password: passwordcontroller.text,
                    );
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Homescreen(),));
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                  }

                }, child: const Text("Sign In")),
              ]),
        ),
      ),
    );
  }
}
