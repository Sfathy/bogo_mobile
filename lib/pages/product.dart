import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import '../models/categoty.dart';

import '../scoped_models/users.dart';

class ProductPage extends StatelessWidget {
  double width;
  double height;

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black12,
      centerTitle: true,
      leading: new IconButton(
        icon: new Image.asset('assets/LoginPage/Big-Logo.png'),
      ),
      title: Text(
        'Fasion',
        style: TextStyle(color: Color(0xFFAD045D)),
      ),
      actions: <Widget>[
        IconButton(
          alignment: Alignment.centerLeft,
          icon: new Image.asset('assets/HomePage/Search-Icons.png'),
        ),
        IconButton(
          icon: new Image.asset('assets/HomePage/Bell-Icons.png'),
        )
      ],
    );
  }

  Widget _buildUserName() {
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(127, 127, 127, 127)),
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        width: double.infinity,
        height: 30.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.person),
              color: Colors.white,
              iconSize: 20.0,
              alignment: Alignment.topRight,
              onPressed: () {},
            ),
            Text(
              'User Name',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocation() {
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(127, 127, 127, 127)),
      // margin: EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        width: double.infinity,
        height: 30.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Image.asset('assets/HomePage/Location-Icons.png'),
              iconSize: 30.0,
              alignment: Alignment.topRight,
              onPressed: () {},
            ),
            Text(
              'Location',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomMenu() {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          icon: IconButton(icon: Image.asset('assets/HomePage/Home-Icons.png')),
          title: Text(
            'Home',
            style: TextStyle(color: Color(0xFFAD045D)),
          ),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
              icon: Image.asset('assets/HomePage/Coupons-Icons.png')),
          title: Text(
            'Category',
            style: TextStyle(color: Color(0xFFAD045D)),
          ),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
              icon: Image.asset('assets/HomePage/Platinum-Icons.png')),
          title: Text(
            'Platinum',
            style: TextStyle(color: Color(0xFFAD045D)),
          ),
        ),
        BottomNavigationBarItem(
          icon: IconButton(icon: Image.asset('assets/HomePage/More-Icons.png')),
          title: Text(
            'More',
            style: TextStyle(color: Color(0xFFAD045D)),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterationButtons() {
    return Container(
      height: 30.0,
      child: Row(
        children: <Widget>[],
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      width: width,
      height: height,
      child: Column(
        children: <Widget>[
          _buildUserName(),
          _buildLocation(),
          _buildFilterationButtons(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return ScopedModelDescendant<UsersModel>(
      builder: (BuildContext context, Widget child, UsersModel model) {
        // model.getValues();
        return Scaffold(
          appBar: _buildAppBar(),
          bottomNavigationBar: _buildBottomMenu(),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.9), BlendMode.dstATop),
                  image: AssetImage('assets/LoginPage/Background.jpg'),
                  fit: BoxFit.fill),
            ),
            child: _buildBody(),
          ),
        );
      },
    );
  }
}
