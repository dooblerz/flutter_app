import 'package:flutter/material.dart';

// Функция для создания кнопок социальных сетей
Widget buildSocialButton(Map<String, dynamic> buttonData) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
    child: SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: buttonData['onPressed'],
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonData['color'],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.symmetric(horizontal: 20), // Равномерные отступы
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Центрируем содержимое
          crossAxisAlignment:
              CrossAxisAlignment.center, // Выравниваем по центру
          children: [
            Icon(buttonData['icon'], color: Colors.white, size: 24), // Иконка
            // SizedBox(width: 6), // Фиксированный отступ между иконкой и текстом
            Expanded(
              child: Text(
                buttonData['text'],
                textAlign: TextAlign.center, // Центрируем текст
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
