import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> screen({
  required String name,
  required String phone,
  required String address,
  required BuildContext context,
}) async {
  try {
    await FirebaseFirestore.instance.collection('datas').add({
      "Name": name,
      "Phone": phone,
      "Address": address,
    });
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Student data uploaded Successfully!")),
    );
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Stream<QuerySnapshot> fetchdata() {
  return FirebaseFirestore.instance.collection('datas').snapshots();
}

Future<void> deletestudent(String id, BuildContext context) async {
  try {
    await FirebaseFirestore.instance.collection('datas').doc(id).delete();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Student details deleted')));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Future<void> updatestudent(
  String id,
  String name,
  String phone,
  String address,
  BuildContext context,
) async {
  try {
    await FirebaseFirestore.instance.collection('datas').doc(id).update({
      "Name": name,
      "Phone": phone,
      "Address": address,
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Student details updated')));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}
