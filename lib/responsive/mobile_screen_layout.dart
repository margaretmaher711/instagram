import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/components/text_field_input.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';

class MobileScreenLayout extends StatefulWidget {
  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  @override
  void initState() {
    super.initState();
    getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('this is mobile')),
    );
  }

  void getUserName() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if(doc.exists) { // this will check availability of document
      print("User is  available");

    }else{
 print("User is not available");
    }
    setState((){});
    // DocumentSnapshot snap = await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(FirebaseAuth.instance.currentUser!.uid)
    //     .get();
    // print('snap.data()');
    // print(snap.data());
  }
}
