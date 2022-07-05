import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'add_user.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key, required this.user}) : super(key: key);
  final Stream<QuerySnapshot> user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            'Read Data form Cloud Firestore',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          StreamBuilder<QuerySnapshot>(
            stream: user,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                final data = snapshot.requireData;
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: data.docs.length,
                    itemBuilder: (context, index) {
                      return Text(
                          'My name is ${data.docs[index]['name']} and i am ${data.docs[index]['age'].toString()} years old');
                    },
                  ),
                );
              }
            },
          ),
          const AddUser(),
        ],
      ),
    );
  }
}
