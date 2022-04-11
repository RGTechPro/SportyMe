import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/firebase/make_events.dart';
import 'package:shop_app/firebase/user.dart';
import 'package:shop_app/models/EventCard.dart';
import 'package:shop_app/models/Profile.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class EventForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();
  final TextEditingController _elgController = TextEditingController();

  static String routeName = "/eventf";

  var _tagsController = TextEditingController();
  var _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          'Create event!',
          style: TextStyle(color: Colors.white),
        ),
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
            Text(
              'Not Your Pick?',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Segoi', fontSize: 24),
            ),
            Text(
              'Create an Event!',
              style: TextStyle(
                  color: Color(0xff3274d8),
                  fontFamily: 'Segoi',
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40.0),
            _buildNameTextFormField(),
            SizedBox(height: 40.0),
            _buildUrlTextFormField(context),
            SizedBox(height: 40.0),
            _buildEligibilityTextFormField(),
            SizedBox(height: 40.0),
            _buildDeadlineTextFormField(),
            SizedBox(height: 40.0),
            _buildDescTextFormField(),
            SizedBox(height: 40.0),
            _buildTagsTextFormField(),
            SizedBox(height: 40.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.red, textStyle: TextStyle(fontSize: 20)),
              onPressed: () => _submit(context),
              child: Text(
                "Create an Event!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )),
      ),
    );
  }

  void _submit(BuildContext context) async {
    // opporValues.add(Opportunities(
    //     equipment: _nameController.text,
    //     url: 'https://' + _urlController.text,
    //     Owner: _deadlineController.text,
    //     equipment_availability: _elgController.text));
    if (_formKey.currentState!.validate()) {
      Profile my =
          await GetProfile(FirebaseAuth.instance.currentUser!.uid).getProfile();
      EventCard card = EventCard(
          userprof: my,
          desc: _descController.text,
          venue: _deadlineController.text,
          sport: _nameController.text,
          time: _urlController.text,
          extratags: _tagsController.text + ", need: " + _elgController.text);
      MakeEvents().addEvent(card).then((value) => print("Success!"));
      Navigator.of(context).pop();
    }
  }

  TextFormField _buildNameTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Sport',
        hintText: 'Badminton',
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

  TextFormField _buildUrlTextFormField(BuildContext context) {
    return TextFormField(
      onTap: () {
        print("inkn");
        DatePicker.showDateTimePicker(context,
            showTitleActions: true,
            minTime: DateTime(2018, 3, 5),
            maxTime: DateTime(2022, 12, 12), onChanged: (date) {
          String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(date);
          _urlController.text = formattedDate;
          print('change $date');
        }, onConfirm: (date) {
          String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(date);
          _urlController.text = formattedDate;

          print('confirm $date');
        }, currentTime: DateTime.now(), locale: LocaleType.en);
      },
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Date-Time Pick',
        hintText: _urlController.text,
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
      //cursorColor: Colors.blue,
      autocorrect: false,
      style: (TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
    );
  }

  TextFormField _buildDeadlineTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Address/location',
        hintText: 'Sector 16 Playground, Patiala',
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
      //cursorColor: Colors.blue,
      autocorrect: false,
      style: (TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
    );
  }

  TextFormField _buildEligibilityTextFormField() {
    return TextFormField(
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter valid Number ';
        }
      },
      decoration: InputDecoration(
        labelText: 'How many Spots',
        hintText: '1',
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

  TextFormField _buildDescTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Desc',
        hintText: 'Short description of this event',
        labelStyle: TextStyle(
          color: Colors.blue,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      controller: _descController,
      autocorrect: false,
      style: (TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
    );
  }

  TextFormField _buildTagsTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'All tags',
        hintText: 'All relevant tags related to this event',
        labelStyle: TextStyle(
          color: Colors.blue,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      controller: _tagsController,
      autocorrect: false,
      style: (TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
    );
  }
}
