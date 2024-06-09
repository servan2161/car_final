//bottom sayfası oluştrarak herhangi bir sayafda bottom menüyü kullanmaız gerektiğinde bu sayfayı
//import ederek çağırdığımızda işimiz kolayşalmış olacak.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class bottom extends StatelessWidget {
  const bottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 32, 36, 40),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10.0, right: 34, left: 34, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(55),
              color: Color.fromARGB(255, 248, 249, 249)),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              icon(context, Icons.home, "/home"),
              icon(context, Icons.shopping_bag, "/home"),
              icon(context, Icons.person, "/profile"),
              icon(context, Icons.settings, "/device"),
            ],
          ),
        ),
      ),
    );
  }

  Padding icon(BuildContext context, IconData icon, String screen) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          context.push(screen);
        },
        child: Icon(
          icon,
          color: Color.fromARGB(255, 32, 36, 40),
          size: 35,
        ),
      ),
    );
  }
}
