import 'package:firebase/AddUser.dart';
import 'package:firebase/ShowUser.dart';
import 'package:firebase/SignIn.dart';
import 'package:firebase/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(onPressed: () async {await FirebaseAuth.instance.signOut();Get.to(Login());},child: Icon(Icons.logout),),
        title: const Text("Homescreen"),),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){Get.to(AddUser());}, child: Text("Add new user")),
            ElevatedButton(onPressed: (){Get.to(ShowUser());}, child: Text("Show list user")),
            ElevatedButton(onPressed: (){}, child: Text("Add new product")),
          ],
        ),
      )
    );
  }
}
