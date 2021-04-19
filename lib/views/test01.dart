import 'package:flutter/material.dart';
import 'package:flutter_firebase_connect/action/dogs.dart';
import 'package:flutter_firebase_connect/views/listdog.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_connect/utilities/constants.dart';
import 'login.dart';

// ignore: camel_case_types
class usersdata extends StatefulWidget {
  usersdata({Key key}) : super(key: key);

  @override
  _usersdataState createState() => _usersdataState();
}

// ignore: camel_case_types
class _usersdataState extends State<usersdata> {
  void initState() {
    super.initState();
  }

  String message = '';
  double padding = 8;
  String usedata = "";
  TextEditingController namecontroller = TextEditingController();
  TextEditingController speciescontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();


  Widget _name() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'name',
          style: kLabelStyle,
        ),
        SizedBox(height: 8.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            controller:namecontroller,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your name',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(

          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),

            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Register Form'),
      ),
      body: Column(
        children: [
          // Container(
          //     color: Colors.blue,
          //     width: MediaQuery.of(context).size.width / 2,
          //     height: 20),
          Column(
            children: [
              SizedBox
                (height: 30.0),
              _name(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: speciescontroller,
                  decoration: InputDecoration(hintText: 'species'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: weightcontroller,
                  decoration: InputDecoration(hintText: 'weight'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: agecontroller,
                  decoration: InputDecoration(hintText: 'age'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () {
                    final res = ActionDog().addNewDog({
                      "name": namecontroller.text.trim(),
                      "species": speciescontroller.text.trim(),
                      "weight": weightcontroller.text.trim(),
                      "age": agecontroller.text.trim(),
                    });
                    print(res);
                  },
                  child: Text('submit'),
                ),
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => listdog(),
                          ));
                    },
                    child: Text('list')),
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ));
                  },
                  child: Text('back'),
                ),
              ),
              Center(child: Text(usedata)),
            ],
          ),
        ],
      ),
    );
  }
}
