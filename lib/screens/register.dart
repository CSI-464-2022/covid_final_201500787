import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_final/models/covid_user.dart';
import 'package:covid_final/screens/login.dart';
import 'package:covid_final/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscureText = true;
  String? _role;
  late String _email, _password, _idnumber, _names, _address, _phone;
  String title = "Role";

  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final emailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final omangField = TextFormField(
      validator: (input) {
        if (input == "" ||
            !RegExp(r'^[0-9]{4}[1-2]{1}[0-9]{4}|[A-Z]{2}[0-9]{7}$')
                .hasMatch(input!)) {
          return 'please correct Idnumber or passport number';
        }
      },
      onSaved: (input) => _idnumber = input!,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.person_add_alt_outlined,
          color: Colors.black87,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "OmangNo or PassportNo",
        labelStyle: TextStyle(color: Colors.black87.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.blueGrey.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
    final nameField = TextFormField(
      validator: (input) {
        if (input == "" || !RegExp(r'^[A-Z a-z]+$').hasMatch(input!)) {
          return 'please type Fullname';
        }
      },
      onSaved: (input) => _names = input!,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.person,
          color: Colors.black87,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "NAME",
        labelStyle: TextStyle(color: Colors.black87.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.blueGrey.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
    final emailField = TextFormField(
      validator: (input) {
        if (input == "" ||
            !RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                .hasMatch(input!)) {
          return 'please type in correct email address';
        }
      },
      onSaved: (input) => _email = input!,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.email_sharp,
          color: Colors.black87,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Email Address",
        labelStyle: TextStyle(color: Colors.black87.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.blueGrey.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
    final physicalAddressField = TextFormField(
      validator: (input) {
        if (input == "" || !RegExp(r'^[A-Z a-z]+$').hasMatch(input!)) {
          return 'ENTER A VALID PHYSICAL ADDRESS';
        }
      },
      onSaved: (input) => _address = input!,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.person_add_alt_outlined,
          color: Colors.black87,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "PHYSICAL ADDRESS",
        labelStyle: TextStyle(color: Colors.black87.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.blueGrey.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
    final phoneNumberField = TextFormField(
      validator: (input) {
        if (input == "" ||
            !RegExp(r'^[7]{1}[1-8]{1}[0-9]{6}$').hasMatch(input!)) {
          return 'PLEASE ENTER A VALID PHONE NUMBER';
        }
      },
      onSaved: (input) => _phone = input!,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.phone,
          color: Colors.black87,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "BOTSWANA PHONE NO.",
        labelStyle: TextStyle(color: Colors.black87.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.blueGrey.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
    final passwordField = TextFormField(
      validator: (input) {
        if (input == "" || !RegExp(r'^[A-Za-z0-9]{9,}$').hasMatch(input!)) {
          return 'password must have at least nine characters';
        }
      },
      onSaved: (input) => _password = input!,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.lock,
          color: Colors.black87,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "PASSWORD",
        labelStyle: TextStyle(color: Colors.black87.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.blueGrey.withOpacity(0.3),
        suffixIcon: IconButton(
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            }),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
      obscureText: _obscureText,
    );
    final confirmPasswordField = TextFormField(
      validator: (input) {
        if (input == "") {
          return 'PLEASE CONFIRM PASSWORD';
        }
        if (kDebugMode) {
          print(password.text);
        }
        if (kDebugMode) {
          print(confirmpassword.text);
        }
        if (password.text != confirmpassword.text) {
          return "PASSWORD DOESN'T MATCH, RE-ENTER";
        }
        return null;
      },
      onSaved: (input) => _password = input!,
      obscureText: _obscureText,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.lock,
          color: Colors.black87,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "CONFIRM PASSWORD",
        labelStyle: TextStyle(color: Colors.black87.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.blueGrey.withOpacity(0.3),
        suffixIcon: IconButton(
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            }),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 136, 179, 87),
      appBar: AppBar(
        title: const Text(
          'REGISTRATION',
          style: TextStyle(
              color: Colors.black87, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            const SizedBox(
              height: 10.0,
            ),
            const SizedBox(
              height: 70.0,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 60.0,
                backgroundImage: AssetImage('lib/assets/LOGO.png'),
              ),
            ),
            const SizedBox(
              height: 20.0,
              child: Text(
                'COVID SAFE',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            DropdownButton<String>(
              value: _role,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              underline: Container(
                height: 5,
                color: Colors.blueGrey,
              ),
              items: <String>['Patient', 'Doctor']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Select role: ",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              onChanged: (newValue) {
                setState(() {
                  _role = newValue;
                });
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            omangField,
            const SizedBox(
              height: 20.0,
            ),
            nameField,
            const SizedBox(
              height: 20.0,
            ),
            reusableTextField("Enter Email", Icons.mail_outline_rounded, false,
                emailEditingController),
            const SizedBox(
              height: 20.0,
            ),
            physicalAddressField,
            const SizedBox(
              height: 20.0,
            ),
            phoneNumberField,
            const SizedBox(
              height: 20.0,
            ),
            passwordField,
            const SizedBox(
              height: 20.0,
            ),
            confirmPasswordField,
            const SizedBox(
              height: 20.0,
            ),
            firebaseUIButton(context, "Sign Up", () async {
              final formState = _formkey.currentState;
              if (formState!.validate()) {
                formState.save();
                try {
                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: emailEditingController.text,
                          password: _password)
                      .then((value) {
                    FirebaseFirestore.instance
                        .collection('Covid User')
                        .doc(value.user!.uid)
                        .set(
                          CovidUser(
                            omang: _idnumber,
                            name: _names,
                            email: emailEditingController.text,
                            role: _role,
                            physicalAddress: _address,
                            phoneNumber: _phone,
                            userId: value.user!.uid,
                          ).toJson(),
                        );
                    if (kDebugMode) {
                      print('created new account');
                    }
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('created new account'),
                      backgroundColor: Colors.red.shade300,
                    ));
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  });
                  //user!.sendEmailVerification();
                  // ignore: prefer_const_constructors

                } on FirebaseAuthException catch (e) {
                  if (kDebugMode) {
                    print('Failed with error code: ${e.code}');
                  }
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Error: ${e.message}'),
                    backgroundColor: Color.fromARGB(255, 170, 39, 39),
                  ));
                  if (kDebugMode) {
                    print(e);
                  }
                }
              }
            }),
            const SizedBox(
              height: 20.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              const Text(
                'Already have an Account?',
                style: TextStyle(color: Colors.black),
              ),
              OutlinedButton(
                onPressed: () {
                  // Respond to button press
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: const Text("login"),
                style: OutlinedButton.styleFrom(
                    primary: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              )
            ])
          ]),
        ),
      ),
    );
  }

  Container firebaseUIButton(
      BuildContext context, String title, Function onTap) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.black26;
              }
              return Colors.blueGrey;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
      ),
    );
  }

  Future<void> signUp() async {
    final formState = _formkey.currentState;
    if (formState!.validate()) {
      formState.save();
      try {
        //var firebaseUser = await FirebaseAuth.instance.currentUser!();
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password)
            .then((value) {
          FirebaseFirestore.instance
              .collection('Covid User')
              .doc(value.user!.uid)
              .set(
                CovidUser(
                  omang: _idnumber,
                  name: _names,
                  email: _email,
                  role: _role,
                  physicalAddress: _address,
                  phoneNumber: _phone,
                  userId: value.user!.uid,
                ).toJson(),
              );
          if (kDebugMode) {
            print('created new account');
          }
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('created new account'),
            backgroundColor: Colors.red.shade300,
          ));
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        });
        //user!.sendEmailVerification();
        // ignore: prefer_const_constructors

      } on FirebaseAuthException catch (e) {
        if (kDebugMode) {
          print('Failed with error code: ${e.code}');
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${e.message}'),
          backgroundColor: Color.fromARGB(255, 170, 39, 39),
        ));
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }
}
