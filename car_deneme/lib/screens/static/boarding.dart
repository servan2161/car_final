import 'package:car_project_vize/core/storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:preload_page_view/preload_page_view.dart';

import '../../widgets/page/boarding_item.dart';

class boarding extends StatefulWidget {
  const boarding({super.key});

  @override
  State<boarding> createState() => _boardingState();
}

class _boardingState extends State<boarding> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 34, 38, 43),
        actions: [
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: InkWell(
                onTap: () async {
                  final storage = Storage();
                  await storage.firstlauched();
                  GoRouter.of(context).replace("/login");
                },
                child: page == 2
                    ? Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      )
                    : Text(
                        "Skip",
                        style: TextStyle(color: Colors.white),
                      )),
          )
        ],
      ),
      backgroundColor: Color.fromARGB(255, 34, 38, 43),
      body: SafeArea(
          child: PreloadPageView(
        onPageChanged: (value) {
          setState(() {
            page = value;
          });
        },
        children: [
          item(
            image: "assets/images/bmw.png",
            title: "The Easy Way to Buy Your Dream Car",
            description:
                "I hear that you want to travel with the car of your dreams.",
          ),
          item(
            image: "assets/images/kontrol.jpg",
            title: "Reliable Expert Report",
            description:
                "We reliably present you the most accurate report of your car with our sworn experts.",
          ),
          item(
            image: "assets/images/satıs.png",
            title: "Easy Payment",
            description:
                "We are here with easy and convenient payment options.",
          ),
        ],
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                page == 0
                    ? CupertinoIcons.circle_filled
                    : CupertinoIcons.circle,
                color: Colors.white,
              ),
              Icon(
                page == 1
                    ? CupertinoIcons.circle_filled
                    : CupertinoIcons.circle,
                color: Colors.white,
              ),
              Icon(
                page == 2
                    ? CupertinoIcons.circle_filled
                    : CupertinoIcons.circle,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
