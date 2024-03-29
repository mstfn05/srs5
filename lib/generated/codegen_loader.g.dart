// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "register": "Registration Page",
  "name": "Write your Full Name",
  "number": "Write your Full Phone Number",
  "mail": "Write your Mail",
  "country": "Select your Country",
  "story": "Tell something about you",
  "password": "Select your Password",
  "sign": "Sign Up",
  "empty": "Its not be empty",
  "nam": "Name",
  "phon": "Phone",
  "ma": "Mail",
  "coun": "Country",
  "stor": "Story",
  "info": "Information Page"
};
static const Map<String,dynamic> kk = {
  "register": "Тіркелу беті",
  "name": "Өзіңіздің аты жөніңізді жазыңыз",
  "number": "Өзіңіздің телефон нөмірін жазыңыз",
  "mail": "Өзіңіздің поштаңызды жазыңыз",
  "country": "Мекен жайыңызды таңдаңыз",
  "story": "Өзіңіз жайлы айтып беріңіз",
  "password": "Құпия сөзді енгізіңіз",
  "sign": "Тіркелу",
  "empty": "Бұд бөлік бос болмауы тиіс",
  "nam": "Аты",
  "phon": "Нөмірі",
  "ma": "Почта",
  "coun": "Мемлекет",
  "stor": "Өмірбаян",
  "info": "Информация бөлімі"
};
static const Map<String,dynamic> ru = {
  "register": "Страница регистрации",
  "name": "Напишите свое ФИО",
  "number": "Напишите свой номер телефона",
  "mail": "Напишите свою почту",
  "country": "Выберите Страну",
  "story": "Расскажите о себе немного",
  "password": "Введите пароль",
  "sign": "Зарегестрироваться",
  "empty": "Данная ячейка не должна быть пустой",
  "nam": "ФИО",
  "phon": "Номер",
  "ma": "Почта",
  "coun": "Страна",
  "stor": "История",
  "info": "Информационный отдел"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "kk": kk, "ru": ru};
}
