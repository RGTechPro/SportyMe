import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_app/firebase/user.dart';
import 'package:shop_app/models/Profile.dart';
import 'package:shop_app/models/RentCard.dart';

class MakeRental {

CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('rentals');

    Future<void> addRental(RentCard eCard) {
      // Call the user's CollectionReference to add a new user
      return _collectionRef
          .add(eCard.toJson())
          .then((value) => print("Entry added"))
          .catchError((error) => print("Failed to add entry: $error"));
    }

}
