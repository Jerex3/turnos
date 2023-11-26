import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(items: const [
      BottomNavigationBarItem(label: "Turnos", icon: Icon(Icons.calendar_month)),
      BottomNavigationBarItem(label: "Perfil", icon: Icon(Icons.person))
    ]);
  }
}
