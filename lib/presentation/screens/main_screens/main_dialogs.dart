import 'package:flutter/material.dart';

void showMessageDialog(BuildContext context) {
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
                          TextFieldMethod(messageController, setState),
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
                          showSuccessDialog(context);
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

TextField TextFieldMethod(
  TextEditingController messageController,
  StateSetter setState,
) {
  return TextField(
    controller: messageController,
    maxLines: 5,
    // maxLength: maxCharacters,
    onChanged: (text) {
      setState(() {});
    },
    decoration: InputDecoration(
      hintText: "Написать",
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      filled: true,
      fillColor: const Color.fromARGB(255, 255, 254, 254),
    ),
  );
}

void showSuccessDialog(BuildContext context) {
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

final List<String> complaints = [
  "Данный пользователь фейк",
  "Пользователь агрессивен и опасен",
  "Непристойное поведение в чате",
  "Нарушение нормы Ислама",
  "Несоблюдение этики общения",
  "Подозрительная личность",
];

Map<String, bool> selectedComplaints = {};

void showComplaintDialog(BuildContext context) {
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
                  ...complaints.map((option) {
                    return Column(
                      children: [
                        CheckboxListTile(
                          value: selectedComplaints[option],
                          onChanged: (bool? value) {
                            setState(() {
                              selectedComplaints[option] = value ?? false;
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
                          bool hasSelectedComplaint = selectedComplaints.values
                              .contains(true);

                          Navigator.pop(context);
                          if (hasSelectedComplaint) {
                            showSuccessDialog(context);
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
