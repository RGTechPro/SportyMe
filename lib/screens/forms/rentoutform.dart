import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/firebase/make_rental.dart';
import 'package:shop_app/models/Profile.dart';
import 'package:shop_app/models/RentCard.dart';
import 'package:shop_app/screens/home/components/card.dart';

import '../../firebase/user.dart';


class RentOutForm extends StatelessWidget {
  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();
  final TextEditingController _elgController = TextEditingController();


  static String routeName = "/rentoutf";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Not your pick?\nCreate your event!',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(child: _buildChildren(context)),
    );
  }

  Widget _buildChildren(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: (Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 60.0),
          _buildNameTextField(),
          SizedBox(height: 60.0),
          _buildUrlTextField(),
          SizedBox(height: 60.0),
          _buildEligibilityTextField(),
          SizedBox(height: 60.0),
          _buildDeadlineTextField(),
          SizedBox(height: 60.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.red, textStyle: TextStyle(fontSize: 17)),
            onPressed: () => _submit(context),
            child: Text(
              "Put out on Rent!",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      )),
    );
  }

  void _submit(BuildContext context) async {
    // opporValues.add(Opportunities(
    //     equipment: _nameController.text,
    //     url: 'https://' + _urlController.text,
    //     Owner: _deadlineController.text,
    //     equipment_availability: _elgController.text));
    Profile my = await GetProfile(FirebaseAuth.instance.currentUser!.uid).getProfile();

    RentCard rentalCard = RentCard(userprof: my, desc: _nameController.text, price: _deadlineController.text, contact: _elgController.text);
    MakeRental().addRental(rentalCard).then((value) => print("Donee"));
    Navigator.of(context).pop();
  }

  TextField _buildNameTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Description',
        hintText: 'Something to tell about your equipment!',
        labelStyle: TextStyle(
          color: Colors.blue,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      controller: _nameController,
      // focusNode: _emailFocus,
      //cursorColor: Colors.black,
      autocorrect: false,
      style: (TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
    );
  }

  TextField _buildUrlTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Sports Equipment to rent out',
        hintText: 'Tennis Racket',
        labelStyle: TextStyle(
          color: Colors.blue,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      controller: _urlController,
      // focusNode: _emailFocus,
      //cursorColor: Colors.black,
      autocorrect: false,
      style: (TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
    );
  }

  TextField _buildDeadlineTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Price per hour',
        hintText: '200 Rs',
        labelStyle: TextStyle(
          color: Colors.blue,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      controller: _deadlineController,
      // focusNode: _emailFocus,
      //cursorColor: Colors.black,
      autocorrect: false,
      style: (TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
    );
  }

  TextField _buildEligibilityTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Contact No.',
        hintText: '+910000000000',
        labelStyle: TextStyle(
          color: Colors.blue,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      controller: _elgController,
      autocorrect: false,
      style: (TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
    );
  }
}
