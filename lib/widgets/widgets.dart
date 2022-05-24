import 'package:covid_final/screens/home_page.dart';
import 'package:covid_final/screens/login.dart';
import 'package:covid_final/services/connect.dart';
import 'package:covid_final/services/Updates.dart';
import 'package:covid_final/services/location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void showBanner(BuildContext context) =>
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

TextField reusableTextField(
  String text,
  IconData icon,
  bool isPasswordType,
  TextEditingController controller,
) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.black87,
    style: TextStyle(color: Colors.black87.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black87,
      ),
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      labelText: text,
      labelStyle: TextStyle(color: Colors.black87.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.blueGrey.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    onChanged: (value) {
      controller = int.parse(value) as TextEditingController;
    },
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  final List<Widget> _children = [
    const HomePage(),
    const VaccinationSites(),
    const Updates()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: _showBottomNav(),
    );
  }

  Widget _showBottomNav() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
          label: 'Centres',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.report_outlined),
          label: 'Updates',
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
}
