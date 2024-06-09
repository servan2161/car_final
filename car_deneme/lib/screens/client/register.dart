// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/localizations.dart';
import '../../widgets/page/appbar.dart';

class register extends StatelessWidget {
  const register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 249, 249),
      appBar: myappbar(
        bar: AppLocalizations.of(context).getTranslate("back"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 32, 36, 40),
            radius: 90,
            child: Icon(
              Icons.person_add,
              size: 80,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          kutu('name', Icons.person, context),
          SizedBox(
            height: 20,
          ),
          kutu('password', Icons.lock, context),
          SizedBox(
            height: 20,
          ),
          kutu('Email', Icons.mail, context),
          SizedBox(
            height: 20,
          ),
          kutu('gender', Icons.wc, context),
          SizedBox(
            height: 120,
          ),
          buton(context),
        ],
      ),
    );
  }

  ElevatedButton buton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.push("/home");
      },
      child: Container(
        width: 150,
        child: Row(
          children: [
            SizedBox(
              height: 50,
            ),
            Icon(
              Icons.how_to_reg,
              size: 30,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Text(
                AppLocalizations.of(context).getTranslate("register"),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 32, 36, 40),
      ),
    );
  }

  Row kutu(String yazi, IconData icon, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.black),
          width: 300,
          child: TextField(
            decoration: InputDecoration(
                fillColor: Color.fromARGB(255, 255, 255, 255),
                filled: true,
                hintText: AppLocalizations.of(context).getTranslate(yazi),
                prefixIcon: Icon(
                  icon,
                  color: Color.fromARGB(255, 32, 36, 40),
                ),
                hintStyle: TextStyle(color: Color.fromARGB(255, 32, 36, 40))),
          ),
        ),
      ],
    );
  }
}
