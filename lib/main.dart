import 'package:flutter/material.dart';
import 'NextPage.dart';
import 'package:http/http.dart' as  http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final List<Widget> itemList = <Widget>[
    pollkaroLogoView(),
    homeView('What Should I do Today ?', "Created"),
    homeView('Where do you think you are going to visit in summer breaks?', "Created"),
    homeView('Should we watch new movies in theaters or on an OTT platform?', "Created"),
    homeView('Microsoft Office is an example of what?', "Created"),
   // pollkaroLogoView1(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body:  ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (BuildContext context, int index) {
            return Builder(
              builder: (BuildContext context) {
                return itemList[index];
              },
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.grey[200], // Background color of the navigation bar
          elevation: 8.0, // Elevation of the navigation bar
          selectedItemColor: Color(0xFF37C66D), // Color of the selected item
          unselectedItemColor: Colors.grey, // Color of the unselected items
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 32.0,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_sharp),
              label: '',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add,
          size: 40.0,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/next');
          },
          backgroundColor: Colors.green,
          shape: CircleBorder(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
      routes: {
        '/next': (context) => NextPage(),
      },
    );
  }
}

   Widget pollkaroLogoView() {
    return Card(
      child: Row(
        children: [
          Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNFcIupXliRUHNFDDBcws6CGfoWdRMpOeYSPJCxSICxQ&s',
            alignment: Alignment.topLeft,
            width: 190.0,
            height: 40.0,
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Builder(
                builder: (context) {
                  return Container(
                    width: 200.0,
                    height: 40.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/next');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF37C66D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),

                        ),
                      ),
                      child: Text(
                        'Create Poll',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
          ),
        ],
      ),
    );
  }

   Widget homeView(String text, String des) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                des,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Share',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
