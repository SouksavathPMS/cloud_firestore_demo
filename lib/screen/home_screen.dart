import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widget/user_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Stream<QuerySnapshot> _user;

  @override
  void initState() {
    _user = FirebaseFirestore.instance.collection('Users').snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cloud Firestore'),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        child: UserList(user: _user),
      ),
    );
  }
}
