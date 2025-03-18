import 'package:flutter/material.dart';

class AccountMainScreen extends StatelessWidget {
  const AccountMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blueAccent, body: CircleStack());
  }
}

class CircleStack extends StatelessWidget {
  const CircleStack({super.key});

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
                  Color.fromRGBO(52, 124, 218, 1),
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
                  Color.fromRGBO(52, 124, 218, 1),
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
                  Color.fromRGBO(52, 124, 218, 1),
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
                  Color.fromRGBO(52, 124, 218, 1),
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
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                    'assets/images/avatar1.png',
                  ), // Путь к изображению
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(height: 8),
                Text(
                  'Диас, 21',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(47, 132, 243, 1),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.settings),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 17),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(47, 132, 243, 1),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Редактировать',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                height: 540,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(23),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // виджет с белым фоном
                          Container(
                            width: 162,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Color(0xFFB3EED8),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(0, 3), // Сдвиг тени
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 14,
                                    right: 10,
                                    top: 15,
                                  ),
                                  child: Text(
                                    'Помощь',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 14,
                                        right: 10,
                                        top: 5,
                                      ),
                                      child: Text(
                                        'Служба \nподдержки',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    Expanded(
                                      child: Image.asset(
                                        'assets/images/bird.png',
                                        width: 68, // Размер изображения
                                        height: 80, // Размер изображения
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 162,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Color(0xFF9AE5FC),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 14,
                                    right: 10,
                                    top: 15,
                                  ),
                                  child: Text(
                                    'FAQ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 14,
                                        right: 10,
                                        top: 5,
                                      ),
                                      child: Text(
                                        'Частые \nвопросы',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    Expanded(
                                      child: Image.asset(
                                        'assets/images/iconstwo.png',
                                        width: 68, // Размер изображения
                                        height: 80, // Размер изображения
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 14,
                            right: 14,
                            top: 14,
                            bottom: 14,
                          ),
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/backgroundContainer.jpeg',
                              ),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Полезные советы',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Мы собрали для вас полезные \nлайфхаки и советы для общения.',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  'assets/images/present.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ),
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

class CircleWidget extends StatelessWidget {
  final double radius;
  final Color color;

  const CircleWidget({super.key, required this.radius, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
