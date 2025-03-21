import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practic_app_course/models/interests.dart';
import 'package:practic_app_course/models/person.dart';
// import 'package:practic_app_course/presentation/screens/main_screens/custom_navigation_bar.dart';
import 'package:practic_app_course/presentation/screens/main_screens/filter_modal.dart';
import 'package:practic_app_course/presentation/screens/main_screens/main_dialogs.dart';
// import 'package:practic_app_course/presentation/screens/main_screens/main_screen_bar.dart';
import 'package:practic_app_course/presentation/screens/main_screens/profile_detail_screen.dart.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
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
      photo2: 'assets/images/aigerim2.png',
      photo3: 'assets/images/aigerim3.png',
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
  void initState() {
    super.initState();
    for (var complaint in complaints) {
      selectedComplaints[complaint] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: buildProfilesTab(context));
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('assets/images/app_logo.svg', height: 20, width: 81),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => FilterModal(),
            );
          },
          icon: Icon(Icons.filter_alt),
        ),
      ],
    );
  }

  Widget buildProfilesTab(BuildContext context) {
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
                  child: buildProfileInfo(person),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildProfileInfo(Person person) {
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
            buildInfoContainer(
              'assets/images/row-height.svg',
              '${person.height} см',
            ),
            SizedBox(width: 10),
            buildInfoContainer('assets/images/search.svg', person.position),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            buildInfoContainer('assets/images/moon.svg', person.hobby),
            SizedBox(width: 10),
            buildInfoContainer('assets/images/briefcase.svg', person.work),
          ],
        ),
      ],
    );
  }

  Widget buildInfoContainer(String iconPath, String text) {
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
}
