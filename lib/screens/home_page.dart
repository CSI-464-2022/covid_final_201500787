import 'package:covid_final/screens/login.dart';
import 'package:covid_final/screens/screens.dart';
import 'package:covid_final/services/connect.dart';
import 'package:covid_final/services/knowledge.dart';
import 'package:covid_final/services/location.dart';
import 'package:covid_final/services/report.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /**leading: 
        ),*/
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        iconTheme: const IconThemeData(color: Colors.green),
        title: const Text("HOME"),
        centerTitle: true,
        shadowColor: Colors.black,
      ),
      drawer: Drawer(
        backgroundColor: Colors.transparent,
        child: ListView(
          children: [
            ListTile(
              //tileColor: Colors.green,
              hoverColor: Colors.blueGrey,
              selectedColor: Colors.blue,
              leading: const Icon(
                Icons.person_outline_rounded,
                color: Colors.green,
              ),
              title:
                  const Text("Profile", style: TextStyle(color: Colors.green)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const ProfilePage())));
              },
            ),
            ListTile(
              //tileColor: Colors.green,
              hoverColor: Colors.blueGrey,
              selectedColor: Colors.blue,
              onTap: () {
                showBanner();
                Navigator.pop(context);
              },
              leading: const Icon(
                Icons.exit_to_app_rounded,
                color: Colors.green,
              ),
              title:
                  const Text("Log out", style: TextStyle(color: Colors.green)),
            )
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          backgroudImage(),
          Column(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Flexible(
                child: GridView.count(
                    crossAxisSpacing: 10,
                    padding: const EdgeInsets.all(20),
                    mainAxisSpacing: 10,
                    primary: false,
                    children: <Widget>[
                      Container(
                          width: 100,
                          height: 100,
                          padding: const EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () {},
                            child: Card(
                                color: Colors.green,
                                elevation: 2,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 40.0,
                                        backgroundImage:
                                            AssetImage('lib/assets/know.jpg'),
                                      ),
                                      Expanded(
                                        child: TextButton(
                                            child: const Text('KNOW'),
                                            style: TextButton.styleFrom(
                                              primary: Colors.black,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          const Knowledge())));
                                            }),
                                      ),
                                    ])),
                          )),
                      Container(
                          width: 100,
                          height: 100,
                          padding: const EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () {},
                            child: Card(
                                color: Colors.green,
                                elevation: 2,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 40.0,
                                        backgroundImage: AssetImage(
                                            'lib/assets/connect.png'),
                                      ),
                                      Expanded(
                                        child: TextButton(
                                            child: const Text('CONNECT'),
                                            style: TextButton.styleFrom(
                                              primary: Colors.black,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Connect()));
                                            }),
                                      )
                                    ])),
                          )),
                      Container(
                          width: 100,
                          height: 100,
                          padding: const EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () {},
                            child: Card(
                                color: Colors.green,
                                elevation: 2,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 40.0,
                                        backgroundImage: AssetImage(
                                            'lib/assets/location.png'),
                                      ),
                                      Expanded(
                                          child: TextButton(
                                              child: const Text('LOCATION'),
                                              style: TextButton.styleFrom(
                                                primary: Colors.black,
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const VaccinationSites()));
                                              })),
                                    ])),
                          )),
                      Container(
                          width: 100,
                          height: 100,
                          padding: const EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () {},
                            child: Card(
                                color: Colors.green,
                                elevation: 2,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 40.0,
                                        backgroundImage: AssetImage(
                                            'lib/assets/report1.png'),
                                      ),
                                      Expanded(
                                          child: TextButton(
                                              child: const Text('REPORTS'),
                                              style: TextButton.styleFrom(
                                                primary: Colors.black,
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const Reports()));
                                              })),
                                    ])),
                          )),
                    ],
                    crossAxisCount: 2),
              )
            ],
          )
        ],
      ),
      //bottomNavigationBar: _showBottomNav(),
    );
  }

  Widget backgroudImage() {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Colors.black, Colors.black12],
        begin: Alignment.bottomCenter,
        end: Alignment.center,
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/wall.jfif'),

            /// change this to your  image directory
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
          ),
        ),
      ),
    );
  }

  int _selectedIndex = 0;
  Widget _showBottomNav() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Shop',
        ),
      ],
      backgroundColor: Colors.blueGrey,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      onTap: _onTap,
    );
  }

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  void showBanner() =>
      ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.all(18),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(primary: Colors.blueGrey),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                FirebaseAuth.instance.signOut().then(
                  (value) {
                    print("Signed Out");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                );
              },
              child: const Text('YES'),
            ),
            TextButton(
                style: TextButton.styleFrom(primary: Colors.purple),
                onPressed: () =>
                    ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                child: const Text('NO'))
          ]));
}
