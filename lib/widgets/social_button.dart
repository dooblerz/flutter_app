import 'package:flutter/material.dart';

// Функция для создания кнопок социальных сетей
Widget buildSocialButton(Map<String, dynamic> buttonData) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
    child: SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        onPressed: buttonData['onPressed'],
        label: Text(buttonData['text'], style: TextStyle(color: Colors.white)),
        icon: Icon(buttonData['icon']),
        style: ElevatedButton.styleFrom(
          iconColor: Colors.white,
          backgroundColor: buttonData['color'],
        ),
      ),
    ),
  );
}
