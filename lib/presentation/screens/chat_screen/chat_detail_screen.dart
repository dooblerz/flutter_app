import 'dart:async';
import 'package:flutter/material.dart';

class ChatDetailScreen extends StatefulWidget {
  final String name;
  final String imagePath;

  ChatDetailScreen({required this.name, required this.imagePath});

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  List<Map<String, dynamic>> messages = []; // Сообщения
  TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add({'text': _controller.text, 'isMe': true});
      });
      _controller.clear();
      _scrollToBottom();

      // Имитация ответа
      Timer(Duration(seconds: 1), () {
        setState(() {
          messages.add({'text': 'Рад знакомству', 'isMe': false});
        });
        _scrollToBottom();
      });
    }
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF2E6DF3),
        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(widget.imagePath)),
            SizedBox(width: 10),
            Text(widget.name),
          ],
        ),
      ),
      body: Column(
        children: [
          _buildProfileInfo(),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(
                  messages[index]['text'],
                  messages[index]['isMe'],
                );
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      children: [
        SizedBox(height: 10),
        CircleAvatar(radius: 40, backgroundImage: AssetImage(widget.imagePath)),
        SizedBox(height: 10),
        Text(
          widget.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text("Алматы", style: TextStyle(color: Colors.grey)),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {},
          child: Text("Посмотреть профиль"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFF8F9FA),
            foregroundColor: Colors.black,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        SizedBox(height: 10),
        if (messages.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text("Сегодня", style: TextStyle(color: Colors.grey)),
          ),
        ],
      ],
    );
  }

  Widget _buildMessage(String text, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isMe ? Color(0xFF2E6DF3) : Color(0xFFF1F3F5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: isMe ? Radius.circular(16) : Radius.zero,
            bottomRight: isMe ? Radius.zero : Radius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isMe ? Colors.white : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      height: 87,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFF1F3F5),
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.attach_file, color: Colors.grey, size: 25),
                onPressed: () {}, // Действие для вложений
              ),
              IconButton(
                icon: Icon(Icons.mic, color: Colors.grey, size: 25),
                onPressed: () {}, // Действие для голосового сообщения
              ),
              Expanded(
                child: SizedBox(
                  height: 36,
                  width: 227,
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Написать",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: _sendMessage,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.send, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
