import 'package:covid_final/screens/auth_gate.dart';
import 'package:covid_final/screens/profile_page.dart';
import 'package:covid_final/services/knowledge.dart';
import 'package:covid_final/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Updates extends StatefulWidget {
  const Updates({Key? key}) : super(key: key);

  @override
  State<Updates> createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const AuthGate())));
              },
            ),
          elevation: 0,
          backgroundColor: Colors.blueGrey,
          iconTheme: const IconThemeData(color: Colors.green),
          title: const Text("COVID-19 UPDATES"),
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
                title: const Text("Profile",
                    style: TextStyle(color: Colors.green)),
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
                  showBanner(context);
                  Navigator.pop(context);
                },
                leading: const Icon(
                  Icons.exit_to_app_rounded,
                  color: Colors.green,
                ),
                title: const Text("Log out",
                    style: TextStyle(color: Colors.green)),
              )
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/wall.jfif'),
                //fit: BoxFit.cover
                fit: BoxFit.cover),
          ),
          //color: Colors.lightGreen,
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  height: 50.0,
                  width: 50.0,
                  child: const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 50.0,
                    backgroundImage: AssetImage('lib/assets/LOGO.png'),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const SizedBox(
                  height: 20.0,
                  child: Text(
                    'COVID- 19 CASE REPORT',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 200.0,
                  width: 400.0,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(15),
                    height: 150.0,
                    width: 400.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/who.PNG'),
                          //fit: BoxFit.cover
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                  child: Text(
                    'CASES STATISTICS',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 200.0,
                  width: 400.0,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(15),
                    height: 170.0,
                    width: 400.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/stats.PNG'),
                          //fit: BoxFit.cover
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                  child: Text(
                    'TESTS STATISTICS',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 200.0,
                  width: 400.0,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(15),
                    height: 170.0,
                    width: 400.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/tests.PNG'),
                          //fit: BoxFit.cover
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                  child: Text(
                    'VACCINES STATISTICS',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 200.0,
                  width: 400.0,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(15),
                    height: 170.0,
                    width: 400.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/vacci.PNG'),
                          //fit: BoxFit.cover
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Container(
                  //color: Colors.blueGrey,
                  alignment: Alignment.center,
                  height: 25,
                  width: 350.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const Knowledge())));
                    },
                    child: const Text(
                      'LEARN MORE ABOUT COVID',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
