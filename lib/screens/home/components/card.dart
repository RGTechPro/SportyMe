import 'package:flutter/material.dart';

class RentCard extends StatelessWidget {
  const RentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
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
                              'https://images.pexels.com/photos/4386404/pexels-photo-4386404.jpeg?cs=srgb&dl=pexels-karolina-grabowska-4386404.jpg&fm=jpg',
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
                              'Sanjeev K. Guleria',
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
                              "Badminton Rackets x2",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Segoi',
                                  fontSize: 13),
                            ),
                            Text(
                              "Badminton Rackets x2",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Segoi',
                                  fontSize: 13),
                            ),
                            Text(
                              "200 Rs",
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
                color: Color(0xfffff1f0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
                border: Border.all(color: Color(0xfffff1f0)))),
      ),
    );
  }
}
