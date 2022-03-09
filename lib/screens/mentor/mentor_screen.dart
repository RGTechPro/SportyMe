import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_bottom_nav_bar.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/home/components/home_header.dart';
import 'package:shop_app/screens/home/components/list_item_builder.dart';
import 'package:shop_app/screens/mentor/card.dart';
import 'package:shop_app/screens/mentor/mentor.dart';
import 'package:shop_app/screens/mentor/mentor_list_tile.dart';
import 'package:shop_app/size_config.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// List<Mentor> mentorValues = [
//   Mentor(
//     name: "Surabhi Mishra",
//     location: "Sector-45 playgound",
//     time: "7:00 - 8:00 pm",
//     image: "assets/images/bunny.png",
//     sport: "Badminton",
//   ),
//   Mentor(
//     name: "Surabhi Mishra",
//     location: "Sector-45 playgound",
//     time: "7:00 - 8:00 pm",
//     image: "assets/images/bunny.png",
//     sport: "Badminton",
//   ),
//   Mentor(
//     name: "Surabhi Mishra",
//     location: "Sector-45 playgound",
//     time: "7:00 - 8:00 pm",
//     image: "assets/images/bunny.png",
//     sport: "Badminton",
//   ),
// ];

class MentorScreen extends StatefulWidget {
  static String routeName = "/mentor";

  const MentorScreen({Key? key}) : super(key: key);

  @override
  _MentorScreenState createState() => _MentorScreenState();
}

class _MentorScreenState extends State<MentorScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var controller = PageController(viewportFraction: 0.95);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xffff6357),
        child: Icon(Icons.add),
      ),
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
              SizedBox(
                height: SizeConfig.screenHeight * .65,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: PageView(
                      controller: controller,
                      onPageChanged: (int i) {
                        setState(() {});
                      },
                      //shrinkWrap: true,
                      //  physics: PageScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [PlayCard(), PlayCard()]),
                ),
              ),
              Center(
                child: SmoothPageIndicator(
                    controller: controller, // PageController
                    count: 6,
                    effect: WormEffect(), // your preferred effect
                    onDotClicked: (index) {}),
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

// Stream<List<Mentor>> mentorStream() {
//   return Stream.value(mentorValues);
// }
