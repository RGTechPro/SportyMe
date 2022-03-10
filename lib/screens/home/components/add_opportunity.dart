import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/components/body.dart';
import 'package:shop_app/screens/home/components/opportunities.dart';

class AddOpportunity extends StatelessWidget {
  static String routeName = "/addOpportunity";
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _elgController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rent an Equipment',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(child: _buildChildren(context)),
    );
  }

  Widget _buildChildren(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
         autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
        child: (Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 25.0),
            _buildNameTextFormField(),
            SizedBox(height: 25.0),
            _buildUrlTextFormField(),
            SizedBox(height: 25.0),
            _buildEligibilityTextFormField(),
            SizedBox(height: 25.0),
            _buildDeadlineTextFormField(),
            SizedBox(height: 18.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor, textStyle: TextStyle(fontSize: 17)),
              onPressed: () => _submit(context),
              child: Text(
                "Submit",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )),
      ),
    );
  }

  void _submit(BuildContext context) {
    opporValues.add(Opportunities(
        equipment: _nameController.text,
        url: 'https://' + _urlController.text,
        Owner: _deadlineController.text,
        equipment_availability: _elgController.text));
    Navigator.of(context).pop();
  }

  TextFormField _buildNameTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Equipment',
        hintText: 'Tennis Racket',
        labelStyle: TextStyle(
          color: Colors.black,
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

  TextFormField _buildUrlTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'URL',
        hintText: 'apac.com',
        labelStyle: TextStyle(
          color: Colors.black,
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

  TextFormField _buildDeadlineTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Owner',
        hintText: 'Rohan Mittal',
        labelStyle: TextStyle(
          color: Colors.black,
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

  TextFormField _buildEligibilityTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Equipment Availability',
        hintText: '6pm to 8pm',
        labelStyle: TextStyle(
          color: Colors.black,
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
