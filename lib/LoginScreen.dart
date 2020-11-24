import 'package:flutter/material.dart';
import 'package:sign_in_google_flutter/HomeScreen.dart';
import 'GoogleHelper.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn();

// Future<String> signInWithGoogle() async {
//   await Firebase.initializeApp();

// final UserCredential authResult = await _auth.signInWithCredential(credential);
//   final User user = authResult.user;

//   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//   final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount.authentication;

//   final AuthCredential credential = GoogleAuthProvider.credential(
//     accessToken: googleSignInAuthentication.accessToken,
//     idToken: googleSignInAuthentication.idToken,
//   );

//   final UserCredential authResult =
//       await _auth.signInWithCredential(credential);
//   final User user = authResult.user;

//   if (user != null) {
//     assert(!user.isAnonymous);
//     assert(await user.getIdToken() != null);

//     final User currentUser = _auth.currentUser;
//     assert(user.uid == currentUser.uid);

//     print('signInWithGoogle succeeded: $user');

//     return '$user';
//   }

//   return null;
// }

// Future<void> signOutGoogle() async {
//   await googleSignIn.signOut();

//   print("User Signed Out");
// }

class LoginScreen extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("assets/cellogo.png"), height: 150.0),
              SizedBox(height: 50),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return HomeScreen();
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black54,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
