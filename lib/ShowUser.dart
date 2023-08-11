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
          title: const Text("List User"),
          centerTitle: true,
          leading: BackButton(onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Homescreen(),
                ));
          }),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              scrollDirection: Axis.vertical,
              children: snapshot.data!.docs.map((snap) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: ListTile(
                    leading: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 50,
                        minHeight: 360,
                        maxWidth: 404,
                        maxHeight: 564,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircleAvatar(child: Icon(Icons.person)),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "${snap['name']}",
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    title: Text("${snap['email']}"),
                    subtitle: Text(
                      "Age : ${snap['age']}",
                      style:
                          const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text("Address"),
                        const SizedBox(height: 4,),
                        Text(
                          "${snap['address']}",
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    onTap: () {},
                    onLongPress: () {},
                    dense: false
                  ),
                );
              }).toList(),
            );
          },
        ));
  }
}
