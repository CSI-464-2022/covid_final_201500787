import 'package:covid_final/screens/auth_gate.dart';
import 'package:covid_final/screens/profile_page.dart';
import 'package:covid_final/services/Updates.dart';
import 'package:covid_final/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Knowledge extends StatefulWidget {
  const Knowledge({Key? key}) : super(key: key);

  @override
  State<Knowledge> createState() => _KnowledgeState();
}

class _KnowledgeState extends State<Knowledge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const AuthGate())));
            },
          ),
          elevation: 0,
          backgroundColor: Colors.blueGrey,
          iconTheme: const IconThemeData(color: Colors.green),
          title: const Text("KNOW COVID-19"),
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
                    'WHAT IS COVID-19?',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    height: 300.0,
                    width: 400.0,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.lightGreen,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: const Text(
                        'Definition',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 200,
                            child: const Text(
                              'an acute disease in humans caused by a coronavirus, which is characterized mainly by fever and cough and is capable of progressing to severe symptoms and in some cases death, especially in older people and those with underlying health conditions. It was originally identified in China in 2019 and became pandemic in 2020.',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(
                  height: 20.0,
                  child: Text(
                    'SIGNS & SYMPTOMPS',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 160.0,
                  width: 400.0,
                  child: ListView(children: [
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          height: 120.0,
                          width: 80.0,
                          child: const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 60.0,
                            backgroundImage: AssetImage('lib/assets/fev.PNG'),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          height: 120.0,
                          width: 80.0,
                          child: const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 80.0,
                            backgroundImage: AssetImage('lib/assets/bre.PNG'),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          height: 120.0,
                          width: 80.0,
                          child: const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 80.0,
                            backgroundImage: AssetImage('lib/assets/cou.PNG'),
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
                const SizedBox(
                  height: 20.0,
                  child: Text(
                    'CORONAVIRUS?',
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
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.blueGrey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: const Text(
                        'Definition',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 200,
                            child: const Text(
                              'Coronaviruses are a type of virus. There are many different kinds, and some cause disease. A coronavirus identified in 2019, SARS-CoV-2, has caused a pandemic of respiratory illness, called COVID-19.',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(
                  height: 20.0,
                  child: Text(
                    'How does the coronavirus spread?',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    height: 350.0,
                    width: 400.0,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.blueGrey,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      title: const Text(
                        'Explanation',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 240,
                            child: const Text(
                              'As of now, researchers know that the coronavirus is spread through droplets and virus particles released into the air when an infected person breathes, talks, laughs, sings, coughs or sneezes. Larger droplets may fall to the ground in a few seconds, but tiny infectious particles can linger in the air and accumulate in indoor places, especially where many people are gathered and there is poor ventilation. This is why mask-wearing, hand hygiene and physical distancing are essential to preventing COVID-19.',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(
                  height: 20.0,
                  child: Text(
                    'BEST PRACTICES',
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
                          image: AssetImage('lib/assets/best.jpg'),
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
                              builder: ((context) => const Updates())));
                    },
                    child: const Text(
                      'CHECK OUT COVID UPDATES',
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
