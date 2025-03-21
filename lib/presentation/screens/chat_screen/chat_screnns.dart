import 'package:flutter/material.dart';
import 'package:practic_app_course/presentation/screens/chat_screen/chat_detail_screen.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> avatars = [
    {'name': 'Айнура', 'image': 'assets/images/ainura.png'},
    {'name': 'Арайлым', 'image': 'assets/images/araylim.png'},
    {'name': 'Карина', 'image': 'assets/images/karina.png'},
    {'name': 'Камилла', 'image': 'assets/images/kamila.png'},
    {'name': 'Салтанат', 'image': 'assets/images/saltanat.png'},
    {'name': 'Алина', 'image': 'assets/images/alina.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150), // Высота AppBar
        child: Container(
          color: Color(0xFF2E6DF3),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40), // Отступ под статусбар
              Text(
                'Заявки на диалог: ${avatars.length}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 26),
              // Горизонтальный список с аватарами
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:
                      avatars
                          .map(
                            (avatar) =>
                                _buildAvatar(avatar['name']!, avatar['image']!),
                          )
                          .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Expanded(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Активный чат',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            _buildChatItem(
              'Команда Joop',
              'assets/images/joop.png',
              'Приветствуем. Рады знакомству...',
              '10:21',
              unreadCount: 2,
            ),
            _buildChatItem(
              'Кристина, 31',
              'assets/images/ainura.png',
              'Ассаламуалейкум сестра',
              'сегодня',
            ),
            _buildChatItem(
              'Айнура, 31',
              'assets/images/saltanat.png',
              'Ассаламуалейкум сестра',
              'сегодня',
            ),
            _buildChatItem(
              'Светлана, 24',
              'assets/images/kamila.png',
              'Ассаламуалейкум сестра',
              'вчера',
            ),
            _buildChatItem(
              'Алина, 24',
              'assets/images/alina.png',
              'Ассаламуалейкум сестра',
              'вчера',
            ),
            _buildChatItem(
              'Карина, 24',
              'assets/images/karina.png',
              'Ассаламуалейкум сестра',
              'вчера',
            ),
          ],
        ),
      ),
    );
  }

  // Виджет для аватара вверху
  Widget _buildAvatar(String name, String imagePath) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 68,
              width: 68,
              child: CircleAvatar(
                // radius: 68,
                backgroundImage: AssetImage(imagePath),
              ),
            ),

            SizedBox(height: 10),
            Text(name, style: TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  // Виджет одного элемента чата
  Widget _buildChatItem(
    String name,
    String imagePath,
    String message,
    String time, {
    int unreadCount = 0,
  }) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => ChatDetailScreen(name: name, imagePath: imagePath),
          ),
        );
      },
      leading: Stack(
        children: [
          CircleAvatar(radius: 30, backgroundImage: AssetImage(imagePath)),
          if (unreadCount > 0)
            Positioned(
              right: 0,
              top: 0,
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.red,
                child: Text(
                  '$unreadCount',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(message, overflow: TextOverflow.ellipsis, maxLines: 1),
      trailing: Text(time, style: TextStyle(color: Colors.grey)),
    );
  }
}
