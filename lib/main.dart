import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Secondpage.dart';
import 'package:flutter_application_1/generated/codegen_loader.g.dart';
import 'package:flutter_application_1/generated/locale_keys.g.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('kk'), Locale('ru')],
        path: 'assets/translations',
        assetLoader: CodegenLoader(),
        fallbackLocale: Locale('en'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: RegistrationForm(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.openSans().fontFamily,
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  bool _hidePass = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _lifeHistoryController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final List<String> _countries = ['Russia', 'Kazakhstan'];
  String _selectedCountry = 'Russia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.register.tr()),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 203, 129, 216),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _nameController,
                    decoration: buildInputDecoration(LocaleKeys.nam.tr(),
                        LocaleKeys.name.tr(), Icons.person),
                    validator: (value) =>
                        validateField(value, LocaleKeys.empty.tr()),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _phoneNumberController,
                    decoration: buildInputDecoration(LocaleKeys.number.tr(),
                        LocaleKeys.phon.tr(), Icons.call),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) =>
                        validateField(value, LocaleKeys.empty.tr()),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: buildInputDecoration(
                        LocaleKeys.ma.tr(), LocaleKeys.mail.tr(), Icons.mail),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => validateEmail(value),
                  ),
                  SizedBox(height: 10.0),
                  DropdownButtonFormField(
                    decoration: buildInputDecoration(LocaleKeys.country.tr(),
                        LocaleKeys.country.tr(), Icons.map),
                    items: buildDropdownMenuItems(),
                    onChanged: (country) => updateSelectedCountry(country),
                    value: _selectedCountry,
                    validator: (value) =>
                        validateDropdown(value, LocaleKeys.country.tr()),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _lifeHistoryController,
                    decoration: buildInputDecoration(
                      LocaleKeys.stor.tr(),
                      LocaleKeys.story.tr(),
                      null,
                      isMultiline: true,
                    ),
                    maxLines: 3,
                    inputFormatters: [LengthLimitingTextInputFormatter(100)],
                    validator: (value) =>
                        validateField(value, LocaleKeys.empty.tr()),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: buildPasswordInputDecoration(
                        LocaleKeys.password.tr(), LocaleKeys.empty.tr()),
                    obscureText: _hidePass,
                    validator: (value) => validatePassword(value),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: buildPasswordInputDecoration(
                        LocaleKeys.password.tr(), LocaleKeys.empty.tr()),
                    obscureText: _hidePass,
                    validator: (value) => validatePasswordConfirmation(value),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () => registerUser(),
                    child: Text(LocaleKeys.sign.tr()),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      context.setLocale(Locale("ru"));
                    },
                    child: Text('Русский'),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      context.setLocale(Locale("en"));
                    },
                    child: Text('English'),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      context.setLocale(Locale("kk"));
                    },
                    child: Text('Қазақша'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(
      String labelText, String hintText, IconData? icon,
      {bool isMultiline = false}) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      icon: icon != null ? Icon(icon) : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(
            color: const Color.fromARGB(255, 255, 255, 255), width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide:
            BorderSide(color: Color.fromARGB(255, 94, 2, 130), width: 2.0),
      ),
    );
  }

  InputDecoration buildPasswordInputDecoration(
      String labelText, String hintText) {
    return buildInputDecoration(labelText, hintText, Icons.security);
  }

  List<DropdownMenuItem<String>> buildDropdownMenuItems() {
    return _countries.map((country) {
      return DropdownMenuItem(
        value: country,
        child: Text(country),
      );
    }).toList();
  }

  void updateSelectedCountry(String? country) {
    setState(() {
      _selectedCountry = country ?? _selectedCountry;
    });
  }

  String? validateField(String? value, String errorText) {
    return (value?.isEmpty ?? true) ? errorText : null;
  }

  String? validateEmail(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Электронная почта не может быть пустой';
    } else if (!(value?.contains('@') ?? false)) {
      return 'Неверный адрес электронной почты';
    }
    return null;
  }

  String? validateDropdown(String? value, String errorText) {
    return (value == null) ? errorText : null;
  }

  String? validatePassword(String? value) {
    return (value?.isEmpty ?? true)
        ? 'Пароль обязателен и должен быть не менее 8 символов'
        : null;
  }

  String? validatePasswordConfirmation(String? value) {
    return (value != _passwordController.text) ? 'Пароли не совпадают' : null;
  }

  void registerUser() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Bottom(
            name: _nameController.text,
            phoneNumber: _phoneNumberController.text,
            email: _emailController.text,
            country: _selectedCountry,
          ),
        ),
      );
    }
  }
}
