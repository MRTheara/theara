import 'package:flutter/material.dart';
class SignUp extends StatelessWidget {
   SignUp({Key? key}) : super(key: key);
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Email"),
                const SizedBox(height: 10,),
                Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                        controller: emailcontroller,
                        style: const TextStyle(fontSize: 20),),
                    )),
                const SizedBox(height: 20,),
                const Text("Password"),
                const SizedBox(height: 10,),
                Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                        controller: passwordcontroller,
                        style: const TextStyle(fontSize: 20),),
                    )),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: ()async{},
                    child: const Text("Sign up")),
              ]),
        ),
      ),
    );
  }
}
