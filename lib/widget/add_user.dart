import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUser extends StatelessWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference user = FirebaseFirestore.instance.collection('Users');
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    return Column(
      children: [
        const Text(
          'Write Data to Cloud Firestore',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'Name',
          ),
        ),
        TextField(
          controller: ageController,
          decoration: const InputDecoration(
            icon: Icon(Icons.numbers_outlined),
            labelText: 'Age',
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            child: const Text('Add User'),
            onPressed: () {
              user.add({
                'name': nameController.text,
                'age': int.parse(ageController.text),
              });
            },
          ),
        ),
      ],
    );
  }
}
