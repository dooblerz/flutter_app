import 'package:flutter/material.dart';
import 'package:practic_app_course/presentation/screens/main_screens/main_screen.dart';
import 'package:practic_app_course/presentation/screens/chat_screen/chat_screnns.dart';
import 'package:practic_app_course/presentation/screens/like_screen/like_screen.dart';
import 'package:practic_app_course/presentation/screens/account_main_screens/account_main_screen.dart';

class MyBar extends StatefulWidget {
  const MyBar({super.key});

  @override
  State<MyBar> createState() => _MyBarState();
}

class _MyBarState extends State<MyBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        // Держит все экраны в памяти, но показывает только один
        index: _selectedIndex,
        children: [
          MainScreen(),
          ChatScreen(),
          LikeScreen(),
          AccountMainScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: const Color(0xFF7D8189),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _selectedIndex =
                index; // Обновляет весь экран, кроме BottomNavigationBar
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Лента"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Чаты"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Лайки"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль"),
        ],
      ),
    );
  }
}
