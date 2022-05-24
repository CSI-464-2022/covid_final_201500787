import 'package:covid_final/screens/auth_gate.dart';
import 'package:covid_final/screens/home_page.dart';
import 'package:covid_final/screens/profile_page.dart';
import 'package:covid_final/services/chat/chatpage.dart';
import 'package:covid_final/services/Updates.dart';
import 'package:covid_final/services/chat/messages.dart';
import 'package:covid_final/services/tabs/medical.dart';
import 'package:covid_final/services/tabs/social.dart';
import 'package:covid_final/services/tabs/world.dart';
import 'package:covid_final/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Connect extends StatefulWidget {
  const Connect({Key? key}) : super(key: key);

  @override
  State<Connect> createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  String? titl;
  List<String> title = ['Social', 'Medical', 'Chat'];
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final tabs = [
      Social(
        title: title[0],
      ),
      Medical(
        title: title[1],
      ),
      MessagesScreen(
        title: title[2],
      ),
    ];
    return MaterialApp(
      title: 'Flutter Demo',
      //theme: _buildShrineTheme(),
      home: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          backgroundColor: Colors.transparent,
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
            title: const Text("CONNECT"),
            centerTitle: true,
            shadowColor: Colors.black,
            automaticallyImplyLeading: false,
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                for (final tab in tabs) Tab(text: tab.toString()),
              ],
            ),
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
          body: TabBarView(
            children: [
              for (final tab in tabs)
                Center(
                  child: tab,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
