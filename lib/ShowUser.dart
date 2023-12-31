import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ShowUser extends StatelessWidget {
  const ShowUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("List User"),
          centerTitle: true,
          leading: BackButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homescreen(),));}),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot) {
            if(!snapshot.hasData){
            return const Center(
            child: CircularProgressIndicator(),
            );
            }return ListView(
              scrollDirection: Axis.vertical,
              children: snapshot.data!.docs.map((snap) {
                return SingleChildScrollView(
                  child: Container(
                    height: 80,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(child: Icon(Icons.person),),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${snap['name']}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  Text("${snap['email']}"),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Age : ${snap['age']}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  Text("Address : ${snap['address']}"),
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
        },

      )
    );
  }
}
