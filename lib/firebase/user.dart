import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

import '../models/Profile.dart';

class GetProfile extends StatelessWidget {
  final String documentId;

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('users');

  GetProfile(this.documentId);

  Future<Profile> getProfile() async{
      var e = await _collectionRef.doc(this.documentId).get();      
      Profile profile = Profile(uid: this.documentId, name: e.get("name"), img: e.get("profile_pic"), email: e.get("email"));
      return Future<Profile>.value(profile);
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        return Text("loading");
      },
    );
  }
}
