import 'package:flutter/material.dart';

class FilterModal extends StatefulWidget {
  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9, // 90% экрана
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 60,
              height: 4,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          // Заголовок
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.filter_list, color: Colors.grey),
                  SizedBox(width: 10),
                  Text(
                    "Фильтр",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(height: 1, color: Colors.grey[400]),
          SizedBox(height: 10),

          // Основное содержимое (вместо SingleChildScrollView используем Expanded)
          Expanded(
            child: ListView(
              controller: _scrollController,
              padding: EdgeInsets.only(right: 20),
              children: [
                _buildFilterOption(context, "Регион", "Выбрать город"),
                Text(
                  "С кем вы хотите общаться:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                _buildToggleOption("Открыт ко всем", true),
                _buildCheckboxOption("Мужчины", false),
                _buildCheckboxOption("Женщины", false),
                Text("Возраст:", style: TextStyle(fontWeight: FontWeight.bold)),
                Slider(value: 21, min: 18, max: 50, onChanged: (value) {}),
                _buildFilterOption(
                  context,
                  "Отношение к Исламу",
                  "Выбрать из списка",
                ),
                _buildFilterOption(context, "Язык общения", "Выбрать язык"),
                _buildFilterOption(context, "Язык общения", "Выбрать язык"),
                _buildFilterOption(context, "Язык общения", "Выбрать язык"),
                _buildFilterOption(context, "Язык общения", "Выбрать язык"),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Кнопка "Поиск"
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: Size(double.infinity, 50),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Поиск",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildFilterOption(BuildContext context, String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(value, style: TextStyle(color: Colors.grey[600])),
                Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildToggleOption(String title, bool isActive) {
    return SwitchListTile(
      value: isActive,
      onChanged: (value) {},
      title: Text(title),
    );
  }

  Widget _buildCheckboxOption(String title, bool isChecked) {
    return CheckboxListTile(
      value: isChecked,
      onChanged: (value) {},
      title: Text(title),
    );
  }
}
