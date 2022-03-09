import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_bottom_nav_bar.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/home/components/home_header.dart';
import 'package:shop_app/screens/home/components/list_item_builder.dart';
import 'package:shop_app/screens/mentor/mentor.dart';
import 'package:shop_app/screens/mentor/mentor_list_tile.dart';
import 'package:shop_app/size_config.dart';

List<Mentor> mentorValues = [
  Mentor(
    name: "Surabhi Mishra",
    location: "Sector-45 playgound",
    time: "7:00 - 8:00 pm",
    image: "assets/images/bunny.png",
    sport: "Badminton",
  ),
  Mentor(
    name: "Surabhi Mishra",
    location: "Sector-45 playgound",
    time: "7:00 - 8:00 pm",
    image: "assets/images/bunny.png",
    sport: "Badminton",
  ),
  Mentor(
    name: "Surabhi Mishra",
    location: "Sector-45 playgound",
    time: "7:00 - 8:00 pm",
    image: "assets/images/bunny.png",
    sport: "Badminton",
  ),
];

class MentorScreen extends StatefulWidget {
  static String routeName = "/mentor";

  const MentorScreen({Key? key}) : super(key: key);

  @override
  _MentorScreenState createState() => _MentorScreenState();
}

class _MentorScreenState extends State<MentorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //        HomeHeader(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Hey, Rishabh!',
                style: TextStyle(
                    color: Colors.black, fontFamily: 'Segoi', fontSize: 32),
              ),
              Text(
                'Looking to play?',
                style: TextStyle(
                    color: Color(0xff3274d8),
                    fontFamily: 'Segoi',
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      child: Container(
                          child: ListView(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                          radius: 45,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(45),
                                            child: Image.network(
                                              'https://images.pexels.com/photos/4386404/pexels-photo-4386404.jpeg?cs=srgb&dl=pexels-karolina-grabowska-4386404.jpg&fm=jpg',
                                              height: 90,
                                              width: 90,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          )),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Sanjeev k. guleria',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'TW',
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "I don't know who you are but yes, I will play badminton",
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
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          "Rose Cottage\n9 Garden Walk (Complex road name is Garden)\nHappy Valley Retirement Village\n75 Davis Street\nNORWOOD SA 5067",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Segoi',
                                              fontSize: 13),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
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
                                        'BASKETBALL',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Koho',
                                            fontSize: 33,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Time: 5.20 pm on 09/03/2022",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Segoi',
                                              fontSize: 13),
                                        ),
                                        Text(
                                          "Extra-tags: Amateur, Fun, Casual Play, Friendly Match, Need One",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Segoi',
                                              fontSize: 13),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: GestureDetector(
                                      child: Container(
                                          child: Text(
                                            "Sure, let's play",
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
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    offset: Offset(0, .5),
                                                    spreadRadius: .1,
                                                    blurRadius: 3),
                                              ],
                                              color: Color(0xffff6357),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              border: Border.all(
                                                  color: Color(0xffff6357)))),
                                    ),
                                  ),
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
                        color: Color(0xffcffde7),
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
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.mentor),
    );
  }
}

// Widget _buildContents(BuildContext context) {
//   return SingleChildScrollView(
//     child: Column(
//       children: [
//         SizedBox(height: getProportionateScreenHeight(40)),
//         HomeHeader(),
//         Container(
//           // height: 90,
//           width: double.infinity,
//           margin: EdgeInsets.all(getProportionateScreenWidth(20)),
//           padding: EdgeInsets.symmetric(
//             horizontal: getProportionateScreenWidth(20),
//             vertical: getProportionateScreenWidth(15),
//           ),
//           decoration: BoxDecoration(
//             color: Color(0xFF009E60),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Center(
//             child: Text(
//               "Available sports players",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: getProportionateScreenWidth(24),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//         Container(
//           height: 490,
//           margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(20), 0,
//               getProportionateScreenWidth(20), 0),
//           child: Stack(children: [
//             StreamBuilder<List<Mentor>>(
//               stream: mentorStream(),
//               builder: (context, snapshot) {
//                 return ListItemBuilder<Mentor>(
//                   snapshot: snapshot,
//                   itemBuilder: (context, mentor) => MentorListTile(
//                     mentor: mentor,
//                     // onTap: () => _showReport(context,report),
//                   ),
//                 );
//               },
//             ),
//             Align(
//               alignment: Alignment.bottomRight,
//               // add your floating action button
//               child: Opacity(
//                 opacity: 0.6,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: FloatingActionButton(
//                     backgroundColor: kPrimaryColor,
//                     onPressed: () {},
//                     child: Icon(
//                       Icons.live_help_outlined,
//                       size: 25,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ]),
//         ),
//       ],
//     ),
//   );
// }

Stream<List<Mentor>> mentorStream() {
  return Stream.value(mentorValues);
}
