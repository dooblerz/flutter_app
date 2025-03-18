import 'package:flutter/material.dart';
import 'package:practic_app_course/core/utils/constants/constants.dart';

// Функция для текста с соглашением
Widget buildAgreementText(bool isChecked, Function(bool?) onChanged) {
  return Row(
    children: [
      Transform.scale(
        scale: 1,
        child: Checkbox(value: isChecked, onChanged: onChanged),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: RichText(
            text: TextSpan(
              style: AppTextStyle.descriptionMediumText,
              children: <TextSpan>[
                TextSpan(
                  text: 'Согласие на',
                  style: TextStyle(
                    color: ButtonColors.buttonDark,
                    fontSize: 14,
                  ),
                ),
                TextSpan(text: " "),
                TextSpan(
                  text:
                      'пользовательское соглаше-\nние и политика конфидициальности.',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
