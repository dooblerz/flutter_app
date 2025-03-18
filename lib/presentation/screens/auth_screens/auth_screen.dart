import 'package:flutter/services.dart';
import 'package:practic_app_course/presentation/widgets/auth_screen_widgets/otp_screen.dart';
// import 'package:intl_phone_field/phone_number.dart';

import '../../../imports.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isChecked = false;
  bool isValidNumber = false;
  final TextEditingController phoneController = TextEditingController();
  String selectedCountry = 'Казахстан';
  String selectedCode = '+7';
  String selectedFlag = '🇰🇿';
  String errorMessage = '';
  Color phoneTextColor = Colors.black;

  final List<Map<String, String>> countries = [
    {'name': 'Казахстан', 'code': '+7', 'flag': '🇰🇿'},
    {'name': 'Россия', 'code': '+7', 'flag': '🇷🇺'},
    {'name': 'Украина', 'code': '+380', 'flag': '🇺🇦'},
    {'name': 'США', 'code': '+1', 'flag': '🇺🇸'},
  ];

  final Map<String, List<String>> validOperators = {
    '+7': [
      '701',
      '702',
      '705',
      '707',
      '708',
      '747',
      '771',
      '775',
      '776',
      '777',
      '778',
    ], // Казахстан
    '+380': [
      '50',
      '63',
      '66',
      '67',
      '68',
      '73',
      '91',
      '92',
      '93',
      '94',
      '95',
      '96',
      '97',
      '98',
      '99',
    ], // Украина
    '+1': ['201', '202', '203', '205', '206', '207'], // США (пример)
  };

  @override
  void initState() {
    super.initState();
    phoneController.addListener(_validatePhoneNumber);
  }

  @override
  void dispose() {
    phoneController.removeListener(_validatePhoneNumber);
    phoneController.dispose();
    super.dispose();
  }

  void _onCheckboxChanged(bool? value) {
    setState(() {
      isChecked = value!;
    });
  }

  void _validatePhoneNumber() {
    String number = phoneController.text.replaceAll(RegExp(r'\D'), '');

    if (number.length >= 3) {
      String operatorCode = number.substring(0, 3);
      bool isValid =
          validOperators[selectedCode]?.contains(operatorCode) ?? false;

      setState(() {
        phoneTextColor =
            isValid ? Colors.black : Colors.red; // Обновляем цвет текста
        isValidNumber = isValid;
        errorMessage =
            isValid ? '' : 'Некорректный номер телефона. Введите заново.';
      });
    } else {
      setState(() {
        phoneTextColor = Colors.black;
        isValidNumber = false;
        errorMessage = '';
      });
    }
  }

  void _selectCountry(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder:
          (context) => Container(
            padding: EdgeInsets.all(16),
            height: 300,
            child: ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];
                return ListTile(
                  leading: Text(
                    country['flag']!,
                    style: TextStyle(fontSize: 24),
                  ),
                  title: Text(country['name']!),
                  trailing: Text(country['code']!),
                  onTap: () {
                    setState(() {
                      selectedCountry = country['name']!;
                      selectedCode = country['code']!;
                      selectedFlag = country['flag']!;
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
    );
  }

  void _showAlertDialog(BuildContext context, String phoneNumber) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Номер указан верно?'),
            content: Text(
              ' $phoneNumber\n\nНаши роботы отправят SMS  с\nкодом активации на указанный\nномер',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Изменить'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => OTPVerificationScreen(),
                          ),
                        );
                      },
                      child: Text('Подтвердить'),
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }

  final List<Map<String, dynamic>> socialButtons = [
    {
      'text': 'Войти через Apple',
      'icon': Icons.apple,
      'color': Colors.black,
      'onPressed': () {},
    },
    {
      'text': 'Войти через Facebook',
      'icon': Icons.facebook,
      'color': AppColors.primaryColor,
      'onPressed': () {},
    },
    {
      'text': 'Войти через Google',
      'icon': Icons.g_translate,
      'color': Colors.grey,
      'onPressed': () {},
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Войти по номеру телефона',
                        style: AppTextStyle.mediumText,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Выравниваем влево
                      children: [
                        Row(
                          children: [
                            // Кнопка выбора страны
                            GestureDetector(
                              onTap: () => _selectCountry(context),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 1,
                                  vertical: 7,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      selectedFlag,
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      selectedCode,
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ), // Отступ между кодом страны и полем ввода
                            // Поле ввода
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                child: TextField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: phoneTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(bottom: 0),
                                  ),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Ошибка под кодом страны и полем ввода
                        if (errorMessage.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                            ), // Отступ вниз от строки
                            child: Text(
                              errorMessage,
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15),
                  buildAgreementText(
                    isChecked,
                    _onCheckboxChanged,
                  ), // Переиспользуемая компонента для соглашения
                  SizedBox(height: 130),
                  // Оборачиваем текст "или войти с помощью" и нижний блок в Offstage
                  Offstage(
                    offstage:
                        isKeyboardVisible, // Скрываем, когда клавиатура видна
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              width: 64,
                              color: ButtonColors.buttonGrey,
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            'или войти с помощью',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              height: 1,
                              width: 64,
                              color: ButtonColors.buttonGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                  // Генерация кнопок социальных сетей динамически
                  ...socialButtons.map(
                    (buttonData) => buildSocialButton(buttonData),
                  ),
                ],
              ),
            ),
          ),
          // Используем Offstage для мгновенного скрытия и отображения кнопки
          Positioned(
            top: 350, // Помещаем кнопку на верх экрана
            left: 15,
            right: 15,
            child: Offstage(
              offstage: !isKeyboardVisible, // Скрываем, когда клавиатура видна
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed:
                      (isChecked && isValidNumber)
                          ? () {
                            String phoneNumber =
                                ' $selectedCode ${phoneController.text}';
                            _showAlertDialog(context, phoneNumber);
                          }
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        (isChecked && isValidNumber)
                            ? Colors.blue
                            : Colors.grey,
                  ),
                  child: Text(
                    'Продолжить',
                    style: TextStyle(
                      color: isChecked ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
