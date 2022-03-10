 import 'package:shop_app/models/Profile.dart';

class RentCard {  
   final Profile userprof;  
   final String desc;  
   final String price;
   final String contact;

   RentCard({
     required this.userprof,
     required this.desc,
     required this.price,
     required this.contact,
   });

  Map<String, Object?> toJson() {
    return {
      "open": true,
      'user': this.userprof.uid,
      'desc': this.desc,
      'price': this.price,
      'contact': this.contact,
    };
  }

}  
