import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_app/firebase/user.dart';
import 'package:shop_app/models/EventCard.dart';
import 'package:shop_app/models/Profile.dart';
import 'package:shop_app/models/RentCard.dart';

class FetchAllRentals {

CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('rentals');

    Future<List<RentCard>> getData() async {
        var e = await _collectionRef.where('open', isEqualTo: true).get();
        var docs = e.docs;

        List<RentCard> myList = <RentCard>[];

        for (var doc in e.docs) {
            var uid = doc.get("user");
            Profile pf = await GetProfile(uid).getProfile();
            String desc = doc.get("desc");
            String price = doc.get("price");
            String contact = doc.get("contact");

            RentCard e = RentCard(userprof: pf, desc: desc, price: price, contact: contact);
            myList.add(e);
        }

        return Future<List<RentCard>>.value(myList);
    }
}
