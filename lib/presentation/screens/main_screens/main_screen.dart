import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practic_app_course/models/interests.dart';
import 'package:practic_app_course/models/person.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Color(0xFF7d8189),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Лента"),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Чат"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Лайки"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль"),
      ],
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Person> people = [
    Person(
      age: 28,
      height: 175,
      hobby: 'Ислам: практикую',
      name: 'Салтанат',
      position: 'Ищу мужа',
      work: 'Менеджер в банке',
      live: 'Алматы',
      education: 'Высшее',
      photo: 'assets/images/photo1.png',
      photo2: 'assets/images/saltanat2.png',
      photo3: 'assets/images/saltanat3.png',
    ),
    Person(
      age: 22,
      height: 175,
      hobby: 'Ислам: практикую',
      name: 'Мерей',
      position: 'Ищу мужа',
      work: 'Менеджер в банке',
      live: 'Алматы',
      education: 'Среднее',
      photo: 'assets/images/image_mer2.png',
      photo2: 'assets/images/saltanat2.png',
      photo3: 'assets/images/saltanat3.png',
    ),
    Person(
      age: 26,
      height: 175,
      hobby: 'Ислам: практикую',
      name: 'Айгерим',
      position: 'Ищу мужа',
      work: 'Менеджер в банке',
      live: 'Алматы',
      education: 'Среднее',
      photo: 'assets/images/image_aig3.png',
      photo2: 'assets/images/saltanat2.png',
      photo3: 'assets/images/saltanat3.png',
    ),
  ];
  final List<Interests> interesting = [
    Interests(
      movie: 'Фильмы',
      music: 'Музыка',
      photoVideo: 'Фото-видео',
      reading: 'Чтение',
      tennis: 'Теннис',
      yoga: 'Йога',
    ),
    Interests(
      movie: 'Фильмы',
      music: 'Музыка',
      photoVideo: 'Фото-видео',
      reading: 'Чтение',
      tennis: 'Теннис',
      yoga: 'Йога',
    ),
    Interests(
      movie: 'Фильмы',
      music: 'Музыка',
      photoVideo: 'Фото-видео',
      reading: 'Чтение',
      tennis: 'Теннис',
      yoga: 'Йога',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildProfilesTab(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  @override
  void initState() {
    super.initState();
    for (var complaint in _complaints) {
      _selectedComplaints[complaint] = false;
    }
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('assets/images/app_logo.svg', height: 20, width: 81),
        ],
      ),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt))],
    );
  }

  Widget _buildProfilesTab(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(15),
      itemCount: people.length,
      itemBuilder: (context, index) {
        final person = people[index];
        final interests = interesting[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 400),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return FadeTransition(
                    opacity: animation,
                    child: ProfileDetailsScreen(
                      person: person,
                      interests: interests,
                    ),
                  );
                },
              ),
            );
          },
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Hero(
                  tag: 'profile_${person.name}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                    child: Image.asset(
                      person.photo,
                      height: 400,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: _buildProfileInfo(person),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfileInfo(Person person) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${person.name}, ${person.age}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            shadows: [Shadow(color: Colors.black, blurRadius: 5)],
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            _buildInfoContainer(
              'assets/images/row-height.svg',
              '${person.height} см',
            ),
            SizedBox(width: 10),
            _buildInfoContainer('assets/images/search.svg', person.position),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            _buildInfoContainer('assets/images/moon.svg', person.hobby),
            SizedBox(width: 10),
            _buildInfoContainer('assets/images/briefcase.svg', person.work),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoContainer(String iconPath, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath, height: 14),
          SizedBox(width: 5),
          Text(text, style: TextStyle(fontSize: 12, height: 1.2)),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Color(0xFF7d8189),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Лента"),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Чаты"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Лайки"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль"),
      ],
    );
  }
}

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
                              _buildInfoRow(
                                'assets/images/row-height.svg',
                                '${widget.person.height} см',
                                24.0,
                                70.0,
                              ),
                              SizedBox(width: 10),
                              _buildInfoRow(
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
                              _buildInfoRow(
                                'assets/images/moon.svg',
                                widget.person.hobby,
                                24.0,
                                145.0,
                              ),
                              SizedBox(width: 10),
                              _buildInfoRow(
                                'assets/images/briefcase.svg',
                                widget.person.work,
                                24.0,
                                148.0,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          _buildInfoRow(
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
                              _buildInfoRowInterest(
                                ' 📸${widget.interests.photoVideo}',
                                26,
                                116,
                              ),
                              SizedBox(width: 10),
                              _buildInfoRowInterest(
                                ' 🍿${widget.interests.movie}',
                                26,
                                90,
                              ),
                              SizedBox(width: 10),
                              _buildInfoRowInterest(
                                ' 🎾${widget.interests.tennis}',
                                26,
                                84,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              _buildInfoRowInterest(
                                ' 🎶${widget.interests.music}',
                                26,
                                87,
                              ),
                              SizedBox(width: 10),
                              _buildInfoRowInterest(
                                ' 🧘‍♀️${widget.interests.yoga}',
                                26,
                                70,
                              ),
                              SizedBox(width: 10),
                              _buildInfoRowInterest(
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
                              _buildInfoRowInterest(' 🇷🇺Русский', 26, 91),
                              SizedBox(width: 10),
                              _buildInfoRowInterest(' 🇰🇿Казахский', 26, 107),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              _buildInfoRowInterest(
                                ' 🇫🇷Французский',
                                26,
                                127,
                              ),
                              SizedBox(width: 10),
                              _buildInfoRowInterest(' 🇬🇧Английский', 26, 114),
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
                              _showComplaintDialog(context);
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
                        _showMessageDialog(context);
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

  Widget _buildInfoRow(
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

  Widget _buildInfoRowInterest(
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

void _showMessageDialog(BuildContext context) {
  TextEditingController messageController = TextEditingController();
  int maxCharacters = 300;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "При новом знакомстве у вас есть возможность написать только одно сообщение.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(height: 1, color: Colors.grey),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: messageController,
                            maxLines: 5,
                            // maxLength: maxCharacters,
                            onChanged: (text) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              hintText: "Написать",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              filled: true,
                              fillColor: const Color.fromARGB(
                                255,
                                255,
                                254,
                                254,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Осталось символов: ${maxCharacters - messageController.text.length}",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),

                Container(height: 1, color: Colors.grey),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            "Отменить",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Container(width: 1, height: 50, color: Colors.grey),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          _showSuccessDialog(context);
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            "Продолжить",
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.zero, // Убираем отступы
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                children: [
                  Image.asset('assets/images/mail.png'),
                  SizedBox(height: 30),
                  Text(
                    'Ваше сообщение отправлено',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
              height: 1,
            ), // Полная ширина
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                minimumSize: Size(double.infinity, 48), // Растягиваем кнопку
              ),
              child: Text(
                'Закрыть',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          ],
        ),
      );
    },
  );
}

final List<String> _complaints = [
  "Данный пользователь фейк",
  "Пользователь агрессивен и опасен",
  "Непристойное поведение в чате",
  "Нарушение нормы Ислама",
  "Несоблюдение этики общения",
  "Подозрительная личность",
];

Map<String, bool> _selectedComplaints = {};

void _showComplaintDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Пожаловаться",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ..._complaints.map((option) {
                    return Column(
                      children: [
                        CheckboxListTile(
                          value: _selectedComplaints[option],
                          onChanged: (bool? value) {
                            setState(() {
                              _selectedComplaints[option] = value ?? false;
                            });
                          },
                          title: Text(option),
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        Divider(height: 1, color: Colors.grey[300]),
                      ],
                    );
                  }).toList(),
                  ListTile(
                    leading: SizedBox(width: 40),
                    title: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Другое',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Divider(height: 1, color: Colors.grey),
                      TextButton(
                        onPressed: () {
                          bool hasSelectedComplaint = _selectedComplaints.values
                              .contains(true);

                          Navigator.pop(context);
                          if (hasSelectedComplaint) {
                            _showSuccessDialog(context);
                          }
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text("Закрыть"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
