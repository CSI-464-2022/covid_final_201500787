import 'package:covid_final/screens/home_page.dart';
import 'package:covid_final/screens/register.dart';
import 'package:covid_final/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:covid_final/screens/login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  late String _email, _password;
  final emailEditingController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      validator: (input) {
        if (input == "" ||
            !RegExp(r'^[A-Za-z0-9]+@([\w-]+\.)+[\w-]{2,}$').hasMatch(input!)) {
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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 136, 179, 87),
      appBar: AppBar(
        title: const Text(
          'SIGN IN',
          style: TextStyle(
              color: Colors.black87, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            backgroudImage(),
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
              height: 25.0,
              child: Text(
                'COVID SAFE',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 35.0,
            ),
            reusableTextField("Enter Email", Icons.mail_outline_rounded, false,
                emailEditingController),
            const SizedBox(
              height: 20.0,
            ),
            passwordField,
            firebaseUIButton(context, "Sign In", () async {
              final formState = _formkey.currentState;
              if (formState!.validate()) {
                formState.save();
                try {
                  //var firebaseUser = await FirebaseAuth.instance.currentUser!();
                  await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailEditingController.text,
                          password: _password)
                      .then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Navigation()));
                  });
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
            TextButton(
                child: const Text('Forgot Password?'),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const ResetPassword())));
                }),
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
                          builder: (context) => const Register()));
                },
                child: const Text("Register"),
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

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: 20,
      height: 10,
      alignment: Alignment.bottomRight,
      child: TextButton(
          child: const Text(
            "Forgot Password?",
            style: TextStyle(color: Colors.black87),
            textAlign: TextAlign.right,
          ),
          onPressed:
              () {} /**Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),*/
          ),
    );
  }
}

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        _emailTextController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 136, 179, 87),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text(
          "Reset Password",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 70.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 60.0,
                    backgroundImage: AssetImage('lib/assets/LOGO.png'),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                  child: Text('COVID SAFE',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(
                  height: 20.0,
                  child: Text('PLEASE ENTER YOUR VALID EMAIL BELOW: ',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                emailField,
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Reset Password", () {
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(email: _emailTextController.text)
                      .then((value) => Navigator.of(context).pop());
                })
              ],
            ),
          ))),
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
}
