import 'package:flutter/material.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center, // Центрируем все круги
      children: [
        // Круги и градиенты, которые вы уже добавили
        OverflowBox(
          minWidth: 0,
          minHeight: 0,
          maxWidth: double.infinity,
          maxHeight: double.infinity,
          child: Container(
            width: 800,
            height: 800,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1,
                colors: [
                  Color.fromRGBO(52, 124, 218, 0),
                  Color.fromRGBO(229, 229, 230, 1),
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),
        ),
        OverflowBox(
          minWidth: 0,
          minHeight: 0,
          maxWidth: double.infinity,
          maxHeight: double.infinity,
          child: Container(
            width: 620,
            height: 620,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1,
                colors: [
                  Color.fromRGBO(52, 124, 218, 0),
                  Color.fromRGBO(229, 229, 230, 1),
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),
        ),
        OverflowBox(
          minWidth: 0.0,
          minHeight: 0.0,
          maxWidth: double.infinity,
          maxHeight: double.infinity,
          child: Container(
            width: 466,
            height: 466,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1,
                colors: [
                  Color.fromRGBO(52, 124, 218, 0),
                  Color.fromRGBO(229, 229, 230, 1),
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),
        ),
        OverflowBox(
          minWidth: 0.0,
          minHeight: 0.0,
          maxWidth: double.infinity,
          maxHeight: double.infinity,
          child: Container(
            width: 315,
            height: 315,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1,
                colors: [
                  Color.fromRGBO(52, 124, 218, 0),
                  Color.fromRGBO(229, 229, 230, 1),
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),
        ),
        // Здесь вы поместили аватарку с текстом в самый верхний слой
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 90.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    'assets/images/Location.png',
                  ), // Путь к изображению
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(height: 8),
                Text(
                  'Пока нет...',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 40,
                  width: 205,
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Text(
                    'У вас к сожалению пока нет лайков. Но есть решение :)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.3),
                height: 480,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/like_photo.jpeg',
                        height: 169,
                        width: 169,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Расскажите о себе',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Чем больше вы о себе расскажете, тем выше вероятность встретить своего человека.',
                        style: TextStyle(
                          color: Color(0xFF7D8187),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(226, 46),
                          backgroundColor: Color(0xFF2E6DF3),
                        ),
                        child: Text(
                          'Редактировать профиль',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
