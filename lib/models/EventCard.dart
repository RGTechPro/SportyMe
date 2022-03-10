 import 'package:shop_app/models/Profile.dart';

class EventCard {  
   final Profile userprof;  
   final String desc;  
   final String venue;
   final String sport;
   final String time;
   final String extratags;

   EventCard({
     required this.userprof,
     required this.desc,
     required this.venue,
     required this.sport,
     required this.time,
     required this.extratags
   });

  Map<String, Object?> toJson() {
    return {
      "open": true,
      'user': this.userprof.uid,
      'desc': this.desc,
      'venue': this.venue,
      'sport': this.sport,
      'time': this.time,
      'tags': this.extratags,
    };
  }

}  
