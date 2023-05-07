import 'package:dashboard/constant/const.dart';
import 'package:dashboard/home/screen/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Responsive Dashboard',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
          primaryColor: MaterialColor(
            colorFlowChart,
            <int, Color>{
              50: const Color(colorFlowChart).withOpacity(0.1),
              100: const Color(colorFlowChart).withOpacity(0.2),
              200: const Color(colorFlowChart).withOpacity(0.3),
              300: const Color(colorFlowChart).withOpacity(0.4),
              400: const Color(colorFlowChart).withOpacity(0.5),
              500: const Color(colorFlowChart).withOpacity(0.6),
              600: const Color(colorFlowChart).withOpacity(0.7),
              700: const Color(colorFlowChart).withOpacity(0.8),
              800: const Color(colorFlowChart).withOpacity(0.9),
              900: const Color(colorFlowChart).withOpacity(1.0),
            },
          ),
          scaffoldBackgroundColor: primaryColor,
          fontFamily: 'IBMPlexSans',
          brightness: Brightness.dark),
      home: DashBoard(),
    );
  }
}
