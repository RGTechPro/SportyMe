import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/firebase/fetch_rental.dart';
import 'package:shop_app/screens/forms/eventform.dart';
import 'package:shop_app/screens/home/components/add_opportunity.dart';
import 'package:shop_app/screens/home/components/card.dart';
import 'package:shop_app/screens/home/components/job_list_tile.dart';
import 'package:shop_app/screens/home/components/list_item_builder.dart';
import 'package:shop_app/screens/home/components/opportunities.dart';

import '../../../models/RentCard.dart';
import '../../../size_config.dart';

import '../../forms/rentoutform.dart';
import 'home_banner.dart';
import 'home_header.dart';

List<Opportunities> opporValues = [
  Opportunities(
      equipment: "Table Tennis Racket(Click to see image)",
      url:
          "https://k9f7a9j9.rocketcdn.me/wp-content/uploads/2021/08/lisa-keffer-i0kB5B9J8Ds-unsplash.jpg",
      equipment_availability: "11am to 6pm, 11th March",
      Owner: "Aviral Nagpal"),
  Opportunities(
      equipment: "Cricket Bat (Click to see image)",
      url:
          "https://cdn.shopify.com/s/files/1/1390/1485/products/image_aacb3d0a-bed1-4265-99c5-5ec95dbf441b_large.jpg?v=1643292001",
      equipment_availability:
          "A full-time student in an accredited university degree at the time of the celebration sept 22,2022",
      Owner: "Rohan Mittal"),
  Opportunities(
      equipment: "Badminton Racket (Click to see image)",
      url:
          "https://cdn.shopify.com/s/files/1/1390/1485/products/image_aacb3d0a-bed1-4265-99c5-5ec95dbf441b_large.jpg?v=1643292001",
      equipment_availability:
          "A full-time student in an accredited university degree at the time of the celebration sept 22,2022",
      Owner: "abc"),
  Opportunities(
      equipment: "Cricket Bat",
      url:
          "https://cdn.shopify.com/s/files/1/1390/1485/products/image_aacb3d0a-bed1-4265-99c5-5ec95dbf441b_large.jpg?v=1643292001",
      equipment_availability:
          "A full-time student in an accredited university degree at the time of the celebration sept 22,2022",
      Owner: "abc2"),
];

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RentOutForm.routeName);
        },
        backgroundColor: Color(0xffff6357),
        child: Icon(Icons.add),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Lacking Equipment?!',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Segoi', fontSize: 32),
            ),
            Text(
              'then Borrow it!',
              style: TextStyle(
                  color: Color(0xff3274d8),
                  fontFamily: 'Segoi',
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: FutureBuilder<List<RentCard>>(
                      future: FetchAllRentals().getData(),
                      builder: (context, AsyncSnapshot<List<RentCard>> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                            return ListView.builder(
                                physics: ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                //shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, int i) {
                                  return RentCardH.from(rentCard: snapshot.data!.elementAt(i));
                              });
                        }
                      })

              
              
            )
          ],
        ),
      )),
    );
  }

  // Widget _buildContent(BuildContext context) {
  //   return Container(
  //     height: 450,
  //     margin: EdgeInsets.all(getProportionateScreenWidth(20)),
  //     child: Stack(children: [
  //       StreamBuilder<List<Opportunities>>(
  //         stream: opporStream(),
  //         builder: (context, snapshot) {
  //           return ListItemBuilder<Opportunities>(
  //             snapshot: snapshot,
  //             itemBuilder: (context, oppor) => JobListTile(
  //               oppor: oppor,
  //               // onTap: () => _showReport(context,report),
  //             ),
  //           );
  //         },
  //       ),
  //       Align(
  //         alignment: Alignment.bottomRight,
  //         // add your floating action button
  //         child: Opacity(
  //           opacity: 0.6,
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: FloatingActionButton(
  //               backgroundColor: kPrimaryColor,
  //               onPressed: () =>
  //                   Navigator.pushNamed(context, AddOpportunity.routeName),
  //               child: Icon(Icons.add),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]),
  //   );
  // }

  // Stream<List<Opportunities>> opporStream() {
  //   return Stream.value(opporValues);
  // }
}
