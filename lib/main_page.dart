import 'package:aas_progmob/login_page.dart';
import 'package:aas_progmob/style.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Image.asset(
            'assets/pict_one.png',
            width: MediaQuery.of(context).size.width,
          ),
          Image.asset(
            'assets/pict_two.png',
            width: MediaQuery.of(context).size.width / 2,
          ),
          const SizedBox(
            height: 13,
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff1E232C),
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                minimumSize: const Size.fromHeight(50),
                side: BorderSide(color: Colors.black),
              ),
              onPressed: () {},
              child: Text(
                "Register",
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Continue as a guest',
                style: TextStyle(
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
