import 'package:flutter/material.dart';

import 'Rows.dart';
import 'images.dart';

class MainPageContent extends StatefulWidget {
  const MainPageContent({Key? key}) : super(key: key);

  @override
  State<MainPageContent> createState() => _MainPageContent();
}


class _MainPageContent extends State<MainPageContent> {
  TextEditingController controller = TextEditingController();

  int _counter = 0;
  String name = "Bilal";
  String data = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const List<String> autoFillFirstName = <String>[
    'bilal',
    'ali',
    'ahmed',
        'amir',
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  customTextField(
                      'Enter Your First Name',
                      'First Name',
                      Icons.person,
                      false,
                      'Please enter first name!',
                      autoFillFirstName,
                      controller: controller),
                  customGap(),
                  customTextField(
                      'Enter Your Last Name',
                      'Last Name',
                      Icons.person,
                      false,
                      'Please enter last name!',
                      autoFillFirstName),
                  customGap(),
                  customTextField(
                      'Enter Your Phone Number',
                      'Phone Number',
                      Icons.phone,
                      false,
                      'Please enter phone number!',
                      autoFillFirstName),
                  customGap(),
                  customTextField(
                      'Enter Your Email Address',
                      'Email Address',
                      Icons.email,
                      false,
                      'Please enter email address!',
                      autoFillFirstName),
                  customGap(),
                  customTextField(
                      'Enter Your Date Of Birth',
                      'DOB',
                      Icons.calendar_month,
                      false,
                      'Please enter dob!',
                      autoFillFirstName),
                  customGap(),
                  customTextField(
                      'Enter Your Password',
                      'Password',
                      Icons.password,
                      true,
                      'Please enter password!',
                      autoFillFirstName),
                  customGap(),
                  customTextField(
                      'Re-Enter Your Password',
                      'Confirm Password',
                      Icons.password,
                      true,
                      'Please enter confirm password!',
                      autoFillFirstName),
                  customGap(),
                  customGap(),
                  Align(
                      alignment: Alignment.center,
                      child: TextButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Process data.
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const RowDemo()));
                          }
                        },
                        icon: const Icon(Icons.create),
                        label: const Text('Sign up'),
                      )),
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ImagePractise()));
                  }, child: const Text('Next Page')),
                  const ElevatedButton(
                    onPressed: null,
                    child: Text('Disabled Button'),
                  )
                ]),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  SizedBox customGap() => const SizedBox(height: 20);

  Widget newWiget(Color? color, double? height){
    return Container(
      height: height,
      color: color,
    );
  }


  Widget customTextField(
      String hint,
      String label,
      IconData iconData,
      bool val,
      String msg,
      List<String> list, {
        TextEditingController? controller,
      }) {
    return TextFormField(
      obscureText: val,
      controller: controller,
      autofillHints: const [AutofillHints.email],
      decoration: InputDecoration(
        icon: Icon(iconData),
        hintText: hint,
        labelText: label,
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return msg;
        }
      },
    );
  }


}
