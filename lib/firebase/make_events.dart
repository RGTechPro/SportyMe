import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_app/firebase/user.dart';
import 'package:shop_app/models/EventCard.dart';
import 'package:shop_app/models/Profile.dart';

class MakeEvents {

CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('events');

    Future<List<EventCard>> getData() async {
        var e = await _collectionRef.where('open', isEqualTo: true).get();
        var docs = e.docs;

        List<EventCard> myList = <EventCard>[];

        for (var doc in e.docs) {
            var uid = doc.get("user");
            Profile pf = await GetProfile(uid).getProfile();
            String desc = doc.get("desc");
            String venue = doc.get("venue");
            String sport = doc.get("sport");
            String time = doc.get("time");
            String tags = doc.get("tags");

            EventCard e = EventCard(userprof: pf, desc: desc, venue: venue, sport: sport, time: time, extratags: tags);
            myList.add(e);
        }

        return Future<List<EventCard>>.value(myList);
    }


    Future<void> addEvent(EventCard eCard) {
      // Call the user's CollectionReference to add a new user
      return _collectionRef
          .add(eCard.toJson())
          .then((value) => print("Entry added"))
          .catchError((error) => print("Failed to add entry: $error"));
    }

}
