//myappar sayfası oluştrarak herhangi bir sayafda bottom menüyü kullanmaız gerektiğinde bu sayfayı
//impot ederek çağırdığımızda işimiz kolayşalmış olacak.

import 'package:flutter/material.dart';

import '../../core/localizations.dart';

class myappbar extends StatelessWidget implements PreferredSizeWidget {
  final String bar;
  const myappbar({Key? key, required this.bar}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(
    BuildContext context,
  ) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 248, 249, 249),
      title: Align(
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).getTranslate("back"),
              ),
              Image.asset(
                "assets/images/caricon.png",
                width: 49,
              )
            ],
          )),
    );
  }
}
