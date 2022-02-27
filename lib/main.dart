import 'package:appchat/screens/chat_screen.dart';
import 'package:appchat/screens/home_screen.dart';
import 'package:appchat/screens/login_screen.dart';
import 'package:appchat/screens/search_screen.dart';
import 'package:appchat/screens/signup_screen.dart';
import 'package:appchat/screens/welcome_screen.dart';
import 'package:appchat/services/helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'models/msg_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppChat());}


///we want to check through shared preferences that is the user logged in or not
///if the user logged in will show chat rooms or else show authentication
class AppChat extends StatefulWidget {

  @override
  State<AppChat> createState() => _AppChatState();
}

class _AppChatState extends State<AppChat> {
  bool userIsLoggedIn = false;
 @override
  void initState() {
   getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
   await HelperFunction.getUserLoggedIn().then((value){
     setState(() {
       userIsLoggedIn = value!;
     });

   });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF01B3B4),
        accentColor: Color(0xFF2A6971)
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: userIsLoggedIn ? HomePage.id :
      LoginPage.id,
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        LoginPage.id: (context) => LoginPage(),
        Signup.id: (context) => Signup(),
        HomePage.id: (context) => HomePage(),
        SearchPage.id: (context)=> SearchPage(),
         ChatPage.id: (context) => ChatPage("smg56"),
      }
    );
  }
}
