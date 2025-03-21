import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practic_app_course/models/interests.dart';
import 'package:practic_app_course/models/person.dart';
import 'package:practic_app_course/presentation/screens/main_screens/custom_navigation_bar.dart';
import 'package:practic_app_course/presentation/screens/main_screens/main_dialogs.dart';

class ProfileDetailsScreen extends StatefulWidget {
  final Person person;
  final Interests interests;

  const ProfileDetailsScreen({
    super.key,
    required this.person,
    required this.interests,
  });

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      child: Image.asset(
                        widget.person.photo,
                        height: 460,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      height: 270,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(color: Color(0xFF2e6df3)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.person.name}, ${widget.person.age}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.white),
                              SizedBox(width: 3),
                              Text(
                                'Живет в г. ${widget.person.live}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                          Text(
                            'Главное обо мне',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              buildInfoRow(
                                'assets/images/row-height.svg',
                                '${widget.person.height} см',
                                24.0,
                                70.0,
                              ),
                              SizedBox(width: 10),
                              buildInfoRow(
                                'assets/images/search.svg',
                                widget.person.position,
                                24.0,
                                100.0,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              buildInfoRow(
                                'assets/images/moon.svg',
                                widget.person.hobby,
                                24.0,
                                145.0,
                              ),
                              SizedBox(width: 10),
                              buildInfoRow(
                                'assets/images/briefcase.svg',
                                widget.person.work,
                                24.0,
                                148.0,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          buildInfoRow(
                            'assets/images/book-open.svg',
                            'Образ-е: ${widget.person.education}',
                            24,
                            160,
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      widget.person.photo2,
                      height: 460,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      height: 170,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(color: Color(0xFF2e6df3)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                'Мои интересы',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(children: [
                              
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              buildInfoRowInterest(
                                ' 📸${widget.interests.photoVideo}',
                                26,
                                116,
                              ),
                              SizedBox(width: 10),
                              buildInfoRowInterest(
                                ' 🍿${widget.interests.movie}',
                                26,
                                90,
                              ),
                              SizedBox(width: 10),
                              buildInfoRowInterest(
                                ' 🎾${widget.interests.tennis}',
                                26,
                                84,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              buildInfoRowInterest(
                                ' 🎶${widget.interests.music}',
                                26,
                                87,
                              ),
                              SizedBox(width: 10),
                              buildInfoRowInterest(
                                ' 🧘‍♀️${widget.interests.yoga}',
                                26,
                                70,
                              ),
                              SizedBox(width: 10),
                              buildInfoRowInterest(
                                ' 📚${widget.interests.reading}',
                                26,
                                85,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 1, color: Colors.grey),
                    Container(
                      width: double.infinity,
                      height: 150,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(color: Color(0xFF2e6df3)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Владение языками',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              buildInfoRowInterest(' 🇷🇺Русский', 26, 91),
                              SizedBox(width: 10),
                              buildInfoRowInterest(' 🇰🇿Казахский', 26, 107),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              buildInfoRowInterest(' 🇫🇷Французский', 26, 127),
                              SizedBox(width: 10),
                              buildInfoRowInterest(' 🇬🇧Английский', 26, 114),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      widget.person.photo3,
                      height: 470,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                      width: double.infinity,
                      height: 410,
                      decoration: BoxDecoration(color: Color(0xFF2e6df3)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'О себе',
                            style: TextStyle(
                              color: Color(0xFFDDE7FD),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Всем привет, меня зовут ${widget.person.name}. Веду активный образ жизни, стараюсь правильно питаться, но устоять от бургеров Макдональдс не всегда удаётся)).\n\nЗдесь ищу здоровые, серьезные отношения где каждый самодостаточен. Я за то чтоб двигать друг друга вперед а не тянуть назад. \n\nВсем успехов и удачи:)',
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          // SizedBox(height: 10),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 48,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(color: Color(0xFF2e6df3)),
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              showComplaintDialog(context);
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              overlayColor: Colors.white.withOpacity(0.3),
                            ),

                            child: Text(
                              'Пожаловаться на данный профиль',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 33,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showMessageDialog(context);
                      },
                      child: Container(
                        height: 54,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            '👋 Написать ${widget.person.name}',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                      child: Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isLiked ? Colors.red : Colors.white,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.favorite,
                            color: !isLiked ? Colors.red : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                    iconSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0, // Или передавай активный индекс, если нужно
        onTap: (index) {
          Navigator.pop(context); // Вернуть назад на главный экран
        },
      ),
    );
  }

  Widget buildInfoRow(
    String iconPath,
    String text,
    double decorationHeight,
    double decorationWidth,
  ) {
    return Container(
      height: decorationHeight,
      width: decorationWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          children: [
            SvgPicture.asset(iconPath, height: 16),
            SizedBox(width: 3),
            Text(
              text,
              style: TextStyle(fontSize: 13, color: Color(0xFF0A40B2)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRowInterest(
    String text,
    double decorationHeight,
    double decorationWidth,
  ) {
    return Container(
      height: decorationHeight,
      width: decorationWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF0A40B2),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
