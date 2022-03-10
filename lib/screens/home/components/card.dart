import 'package:flutter/material.dart';
import 'package:shop_app/models/RentCard.dart';

import '../../../models/Profile.dart';

class RentCardH extends StatelessWidget {
  RentCardH({Key? key}) : super(key: key);

  RentCard rentCard = RentCard(
      userprof: Profile(
          uid: "id",
          name: "Anonymous User",
          img:
              "https://images.pexels.com/photos/4386404/pexels-photo-4386404.jpeg?cs=srgb&dl=pexels-karolina-grabowska-4386404.jpg&fm=jpg",
          email: "email"),
      desc: "I don't know who you are but yes, I will play badminton",
      price: "200 Rs/-",
      contact: "+91 0000 000000");

  RentCardH.from({
    required this.rentCard,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          //height: 190,
          child: Column(

              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                        radius: 45,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(45),
                          child: Image.network(
                            rentCard.userprof.img,
                            height: 90,
                            width: 90,
                            fit: BoxFit.fitWidth,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            rentCard.userprof.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'TW',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 200,
                            child: Text(rentCard.desc),
                          ),
                          // Text(
                          //   rentCard.desc,
                          //   style: TextStyle(
                          //       color: Colors.black,
                          //       fontFamily: 'Segoi',
                          //       fontSize: 13),
                          // ),
                          Text(
                            rentCard.price + " Rs",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Segoi',
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: GestureDetector(
                    child: Container(
                        width: double.infinity,
                        child: Text(
                          "Negotiate",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Segoi',
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        height: 40,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: Offset(0, .5),
                                  spreadRadius: .1,
                                  blurRadius: 3),
                            ],
                            color: Color(0xffff6357),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Color(0xffff6357)))),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ]),
          decoration: BoxDecoration(
              color: Color(0xfffff1f0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
              border: Border.all(color: Color(0xfffff1f0)))),
    );
  }
}
