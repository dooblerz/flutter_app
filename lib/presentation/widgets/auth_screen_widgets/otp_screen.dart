import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  OTPVerificationScreenState createState() => OTPVerificationScreenState();
}

class OTPVerificationScreenState extends State<OTPVerificationScreen>
    with SingleTickerProviderStateMixin {
  int _secondsRemaining = 60;
  late Timer _timer;
  bool _isButtonEnabled = false;
  final TextEditingController _pinController = TextEditingController();
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _startTimer();

    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _pinController.addListener(() {
      setState(() {}); // Обновление состояния при изменении текста
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _isButtonEnabled = true;
        });
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    _pinController.dispose();
    super.dispose();
  }

  void _resendCode() {
    setState(() {
      _secondsRemaining = 44;
      _isButtonEnabled = false;
    });
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 44,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.blue),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              "Введите код активации",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65.0),
              child: Pinput(
                length: 4,
                controller: _pinController,
                keyboardType: TextInputType.number,
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 2, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Введите 4-х значный код",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: _isButtonEnabled ? _resendCode : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.rotate(
                    angle: 3.14 * 3, // Поворот иконки влево на 90 градусов
                    child: Icon(Icons.refresh, color: Color(0xFF7D8187)),
                  ),
                  SizedBox(width: 5),
                  Text(
                    _isButtonEnabled
                        ? "Отправить код повторно"
                        : "Повторно отправить код: $_secondsRemaining сек",
                    style: TextStyle(color: Color(0xFF7D8187), fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pinController.text.length == 4 ? () {} : null,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _pinController.text.length == 4
                        ? Colors.blue
                        : Color(0xFFF1F3F5),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Продолжить",
                style: TextStyle(
                  color:
                      _pinController.text.length == 4
                          ? Colors.white
                          : Color(0xFFD2D4D6),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
