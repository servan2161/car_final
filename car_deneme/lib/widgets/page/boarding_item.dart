import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class item extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const item({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                image,
              ),
            ),
            Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Gap(20),
                Text(
                  description,
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
