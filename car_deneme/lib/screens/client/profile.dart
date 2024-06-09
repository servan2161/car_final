import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../core/localizations.dart';
import '../../widgets/page/appbar.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 249, 249),
      appBar: myappbar(
        bar: AppLocalizations.of(context).getTranslate("back"),
      ),
      body: Column(
        children: [profile_widget(context), features(context)],
      ),
    );
  }
}

Container features(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), // Sol üst köşeyi yuvarlar
          topRight: Radius.circular(25), // Sağ üst köşeyi yuvarlar
        ),
        color: Color.fromARGB(255, 248, 249, 249)),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                AppLocalizations.of(context).getTranslate("function"),
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Gap(14),
          Row(
            children: [
              features_container(Icons.engineering, "talent", context),
              Gap(17),
              features_container(
                  Icons.precision_manufacturing, "auto", context),
              Gap(17),
              features_container(Icons.directions_car, "driving", context),
            ],
          ),
          Gap(12),
          profile_container_last(context, Icons.garage_outlined, "Mycar"),
          Gap(12),
          profile_container_last(context, Icons.share, "social"),
          Gap(17),
          signup(context)
        ],
      ),
    ),
  );
}

ElevatedButton signup(BuildContext context) {
  return ElevatedButton(
      onPressed: () {
        context.push("/login");
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: 485,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context).getTranslate("log_out"),
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.logout,
              size: 20,
              color: (Colors.white),
            ),
          ],
        ),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(200, 46),
          primary: Color.fromARGB(255, 32, 36, 40),
          onPrimary: Color.fromARGB(255, 32, 36, 40)));
}

Container profile_container_last(
    BuildContext context, IconData icon, String header) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      color: Color.fromARGB(209, 228, 229, 229),
    ),
    width: 485,
    height: 80,
    child: Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 36,
            color: Color.fromARGB(255, 32, 36, 40),
          ),
          Gap(23),
          Text(
            AppLocalizations.of(context).getTranslate(header),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          )
        ],
      ),
    ),
  );
}

Container features_container(
    IconData icon, String header, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      color: Color.fromARGB(209, 228, 229, 229),
    ),
    width: 150,
    height: 150,
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.transparent,
                    border: Border.all(
                        width: 2, color: Color.fromARGB(255, 52, 55, 60))),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    icon,
                    size: 45,
                    color: Color.fromARGB(255, 32, 36, 40),
                  ),
                ),
              ),
            ],
          ),
          Gap(20),
          Row(
            children: [
              Text(
                AppLocalizations.of(context).getTranslate(header),
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
              )
            ],
          ),
        ],
      ),
    ),
  );
}

Container profile_widget(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 450,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), // Sol üst köşeyi yuvarlar
          topRight: Radius.circular(25), // Sağ üst köşeyi yuvarlar
        ),
        color: Color.fromARGB(255, 32, 36, 40)),
    child: Padding(
      padding: const EdgeInsets.only(top: 90.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_circle,
                size: 150,
                color: Color.fromARGB(255, 248, 249, 249),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Servan And Ceren",
                style: TextStyle(
                    color: Color.fromARGB(255, 248, 249, 249),
                    fontSize: 30,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
          Gap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context).getTranslate("profile_car"),
                style: TextStyle(
                    color: Color.fromARGB(255, 248, 249, 249),
                    fontWeight: FontWeight.w100,
                    fontSize: 15),
              )
            ],
          )
        ],
      ),
    ),
  );
}
