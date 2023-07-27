import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUser extends StatelessWidget {
  AddUser({Key? key}) : super(key: key);
  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  CollectionReference user = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("Add new user")),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Add User",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              Container(
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                      hintText: "Name",
                    ),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                width: 300,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)
                ),
                child:  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: agecontroller,
                    decoration: InputDecoration(
                      hintText: "Age",
                    ),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                width: 300,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)
                ),
                child:  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      hintText: "Email",
                    ),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                width: 300,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)
                ),
                child:  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: addresscontroller,
                    decoration: InputDecoration(
                      hintText: "Address",
                    ),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                try{
                  user.add({
                    'name':namecontroller.text,
                    'age':agecontroller.text,
                    'email':emailcontroller.text,
                    'address':addresscontroller.text,
                  });
                }catch (e){
                  print('error');
                }
              }, child: const Text("Add")),
            ],
          ),
        ),
      ),
    );
  }
}
