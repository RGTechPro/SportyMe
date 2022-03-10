import 'package:flutter/material.dart';
import 'package:shop_app/models/EventCard.dart';
import 'package:shop_app/models/Profile.dart';
import '../../constants.dart';

class PlayCard extends StatelessWidget {
  PlayCard({Key? key}) : super(key: key);

  EventCard eventCard = EventCard(
  userprof: 
    Profile(uid: "id", 
    name: "Anonymous User", 
    img: "https://images.pexels.com/photos/4386404/pexels-photo-4386404.jpeg?cs=srgb&dl=pexels-karolina-grabowska-4386404.jpg&fm=jpg", 
    email: "email"), 
  desc: "I don't know who you are but yes, I will play badminton", 
  venue: "Rose Cottage, 9 Garden Walk (Complex road name is Garden), Happy Valley Retirement Village, 75 Davis Street, NORWOOD SA 5067", 
  sport: "BASKETBALL", 
  time: "5.20 pm on 09/03/2022", 
  extratags: "Extra-tags: Amateur, Fun, Casual Play, Friendly Match, Need One");

  PlayCard.from({
    required this.eventCard,
});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Container(
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
                                this.eventCard.userprof.img,
                                height: 90,
                                width: 90,
                                fit: BoxFit.fitWidth,
                              ),
                            )),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  this.eventCard.userprof.name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'TW',
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  this.eventCard.desc,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Segoi',
                                      fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Venue:',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Segoi',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            this.eventCard.venue,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Segoi',
                                fontSize: 13),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sports_basketball,
                          size: 45,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          this.eventCard.sport,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Koho',
                              fontSize: 33,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Time: " + this.eventCard.time,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Segoi',
                                fontSize: 13),
                          ),
                          Text(
                            "Extra-Tags: " + this.eventCard.extratags,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Segoi',
                                fontSize: 13),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: GestureDetector(
                        child: Container(
                            width: double.infinity,
                            child: Text(
                              "Sure, let's play!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Segoi',
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            height: 48,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: Offset(0, .5),
                                      spreadRadius: .1,
                                      blurRadius: 3),
                                ],
                                color: Color(0xffff6357),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(color: Color(0xffff6357)))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ]),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                  border: Border.all(color: Colors.white))),
        ),
        decoration: BoxDecoration(
            color: kCardBgColor,
            // boxShadow: [
            //   BoxShadow(
            //       color: Colors.grey.withOpacity(0.5),
            //       offset: Offset(0, .5),
            //       spreadRadius: .1,
            //       blurRadius: 3),
            // ],
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: Color(0xffcffde7))),
      ),
    );
  }
}
