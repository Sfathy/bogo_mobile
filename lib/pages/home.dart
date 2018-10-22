import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import '../models/categoty.dart';

import '../scoped_models/users.dart';

class HomePage extends StatelessWidget {
  final List<Category> _categotyList = [
    new Category(
        categoryName: 'Resturants & Cafes',
        id: 1,
        icon: 'assets/HomePage/Resturants-Icons.png',
        brands: [
          new Brand(
              id: 0,
              brandName: 'Pizza Hut',
              brandDescription: '25% Refund',
              brandImage: 'assets/HomePage/Pizza-Hut.png'),
          new Brand(
              id: 1,
              brandName: 'Chili\'s',
              brandDescription: '20% Refund',
              brandImage: 'assets/HomePage/Chilis.png'),
          new Brand(
              id: 2,
              brandName: 'Starbucks',
              brandDescription: '15% Refund',
              brandImage: 'assets/HomePage/Starbucks.png'),
        ]),
    new Category(
        categoryName: 'Specials',
        id: 2,
        icon: 'assets/HomePage/Specilas-Icons.png',
        brands: []),
  ];

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black12,
      centerTitle: true,
      leading: new IconButton(
        icon: new Image.asset('assets/LoginPage/Big-Logo.png'),
      ),
      title: Text(
        '',
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

  Widget _buildBrandCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      height: 150.0,
      margin: EdgeInsets.all(30.0),
      child: InkWell(),
    );
  }

  Widget _buildCategotyCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color.fromARGB(127, 127, 127, 127),
      ),
      height: 250.0,
      margin: EdgeInsets.all(10.0),
      child: _buildCategoryContet(),
    );
  }

  Widget _buildBrandList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/HomePage/previous-icons-inner.png',
          height: 30.0,
          width: 30.0,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/HomePage/Pizza-Hut.png',
                height: 100.0,
                width: 80.0,
              ),
              Text('Pizza Hut'),
              Text('25 % Refund'),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/HomePage/Chilis.png',
                height: 100.0,
                width: 80.0,
              ),
              Text('Chili\'s'),
              Text('15 % Refund'),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/HomePage/Starbucks.png',
                height: 100.0,
                width: 80.0,
              ),
              Text('Starbucks'),
              Text('20 % Refund'),
            ],
          ),
        ),
        Image.asset(
          'assets/HomePage/next-icons-inner.png',
          height: 30.0,
          width: 30.0,
        ),
      ],
    );
  }

  Widget _buildMoreButton() {
    return Container(
      alignment: Alignment.bottomRight,
      margin: EdgeInsets.all(15.0),
      child: RaisedButton(
        color: Color(0xFFAD045D),
        textColor: Colors.white,
        child: Text('More'),
        onPressed: () {
          //Navigator.pushReplacementNamed(context, '/home');
        },
      ),
    );
  }

  Widget _buildCategoryContet() {
    return Container(
      constraints: BoxConstraints(minWidth: 400.0, minHeight: 200.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Image.asset(_categotyList[0].icon),
              ),
              Text(
                _categotyList[0].categoryName,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          _buildBrandList(),
          _buildMoreButton(),
        ],
      ),
    );
  }

  List<String> _advList = [
    'assets/HomePage/small-image.png',
    'assets/HomePage/big-image.png',
    'assets/HomePage/small-image.png',
  ];
  Widget _buildAdvPic() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _advList.length,
       // reverse: true,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: <Widget>[
                Image.asset(
                  _advList[index],
                  height: 250.0,
                  width: 100.0,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCatItem(BuildContext context, int index) {
    return Card(
        
        child: RaisedButton(
           shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(75.0)),
          child: Text(_categotyList[index].categoryName),
          color: Color(0xFFAD045D),
          onPressed: () {},
        ),
      
    );
  }

  Widget _buildCatButtons() {
    return Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          //reverse: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: _buildCatItem,
      itemCount: _categotyList.length,
    ));
  }

  Widget _buildBody() {
    return //Column(children:<Widget>[ _buildCatButtons()]);
        Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _buildUserName(),
        _buildLocation(),
        _buildAdvPic(),
        
        
         _buildCatButtons(),
        
        _buildCategotyCard(),
        Container(),
      ],
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

  @override
  Widget build(BuildContext context) {
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
          /*ListView(
             children: <Widget>[
               Text('1'),
               Text('2'),
               Text('3')
             ],
           )*/
          //padding: EdgeInsets.all(10.0),
        ),
      );
    });
  }
}
