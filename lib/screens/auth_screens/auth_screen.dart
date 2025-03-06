import '../../imports.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isChecked = false;

  void _onCheckboxChanged(bool? value) {
    setState(() {
      isChecked = value!;
    });
  }

  // Список данных для кнопок социальных сетей
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
      'icon': Icons.back_hand,
      'color': ButtonColors.buttonLighter,
      'onPressed': () {},
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
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
                    child: IntlPhoneField(
                      initialCountryCode: 'KZ',
                      dropdownTextStyle: AppTextStyle.highText,
                      decoration: InputDecoration(
                        hintText: '',
                        contentPadding: EdgeInsets.only(bottom: 5),
                      ),
                      dropdownIcon: Icon(
                        FontAwesomeIcons.chevronDown,
                        color: ButtonColors.buttonDark,
                        size: 15,
                      ),
                      style: AppTextStyle.highText,
                      dropdownIconPosition: IconPosition.trailing,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(height: 15),
                  buildAgreementText(
                    isChecked,
                    _onCheckboxChanged,
                  ), // Переиспользуемая компонента для соглашения
                  SizedBox(height: 130),
                  Padding(
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
                  SizedBox(height: 50),
                  // Генерация кнопок социальных сетей динамически
                  ...socialButtons.map(
                    (buttonData) => buildSocialButton(buttonData),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: isKeyboardVisible ? 10 : -60,
            left: 15,
            right: 15,
            child: Visibility(
              visible: isKeyboardVisible,
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Продожить'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
