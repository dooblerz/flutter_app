import 'package:flutter/material.dart';
import 'package:practic_app_course/core/utils/constants/constants.dart';
import 'package:practic_app_course/presentation/screens/main_screens/main_dialogs.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  TextEditingController control = TextEditingController();
  int maxWords = 300;

  @override
  void initState() {
    super.initState();
    control.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    control.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F9FA),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
        ),
        title: Text(
          'Служба поддержки',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true, // Выравнивание по центру (по желанию)
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14, top: 30),
        child: Column(
          children: [
            Text(
              'Если у вас есть вопросы или предложения касательно приложения Aina, вы можете написать нам. Будем признательны, спасибо.',
              style: TextStyle(
                color: Color(0xFF2E3138),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 40),
            TextFieldMethod(control, setState),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Осталось символов: ${maxWords - control.text.length}",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                  color: Color(0xFFF1F3F5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Align(
                  child: Text(
                    'Отправить',
                    style: TextStyle(
                      color: Color(0xFF7D8187),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
