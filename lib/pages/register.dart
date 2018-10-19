import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped_models/users.dart';
import '../models/user.dart';

class RegPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegPageState();
  }
}

class RegPageState extends State<RegPage> {
  String _firstName;
  String _lastName;
  String _emailValue;
  String _password;
  String _mobile;
  String _gender;
  DateTime _birthdate;
  String _mac;
  String _location;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.9), BlendMode.dstATop),
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover),
        ),
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: <Widget>[
            SizedBox(height: 200.0),
            TextField(
              decoration: InputDecoration(
                  labelText: 'First Name',
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.pink,
                  ),
                  border: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.lime)),
                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.white)),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(color: Colors.white),
              onChanged: (String value) {
                setState(() {
                  _firstName = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Last Name',
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.pink,
                  ),
                  border: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.lime)),
                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.white)),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(color: Colors.white),
              onChanged: (String value) {
                setState(() {
                  _lastName = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.pink,
                  ),
                  border: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.lime)),
                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.white)),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(color: Colors.white),
              onChanged: (String value) {
                setState(() {
                  _emailValue = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.pink,
                  ),
                  border: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.lime)),
                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.white)),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(color: Colors.white),
              onChanged: (String value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.pink,
                  ),
                  border: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.lime)),
                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.white)),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20.0),
            ScopedModelDescendant<UsersModel>(builder:
                (BuildContext context, Widget child, UsersModel model) {
              return SizedBox(
                width: 500.0,
                child: RaisedButton(
                  color: Colors.pink,
                  
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  textColor: Colors.white,
                  
                  child: Text('Sign up'),
                  onPressed: () {
                    // model.login(_emailValue, _passwordValue);
                    User user = new User(
                        userName: _emailValue,
                        token: "",
                        id: 0);
                    model.signUp(user);
                    Navigator.pushReplacementNamed(context, '/home');
                  }));
            }),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      child: Text('Back to Login'),
                      textColor: Theme.of(context).accentColor,
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
