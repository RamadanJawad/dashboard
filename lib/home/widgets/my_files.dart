import 'package:dashboard/constant/const.dart';
import 'package:dashboard/constant/responsive.dart';
import 'package:flutter/material.dart';

class MyFilesWidget extends StatelessWidget {
  const MyFilesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "My Files",
            style: TextStyle(fontSize: 20),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: cardBackgroundColor,
              padding: EdgeInsets.symmetric(
                horizontal: 10 * 1.5,
                vertical: 14 / (Responsive.isMobile(context) ? 2 : 1),
              ),
            ),
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text("Add New"),
          ),
        ],
      ),
    );
  }
}
