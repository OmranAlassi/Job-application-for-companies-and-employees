import 'package:flutter/material.dart';

class StyleLoginScreen {
  Color? backgroundcolor;
  String? title;
  StyleLoginScreen({this.backgroundcolor, this.title});
}

List<StyleLoginScreen> styles = [
  StyleLoginScreen(backgroundcolor: Colors.teal, title: 'تسجيل الدخول'),
  StyleLoginScreen(
    backgroundcolor: Color(0XFFE0E0E0),
    title: 'البريد الإلكتروني',
  ),
  StyleLoginScreen(backgroundcolor: Color(0XFF8E8E8E), title: 'كلمة المرور'),
  StyleLoginScreen(backgroundcolor: Colors.tealAccent, title: 'اسم المستخدم'),
  StyleLoginScreen(backgroundcolor: Color(0XFFFFFFFF), title: 'إنشاء حساب'),
  StyleLoginScreen(title: 'نوع الحساب'),
  StyleLoginScreen(title: 'اسم الشركة'),
  StyleLoginScreen(title: 'الاسم الكامل'),
  StyleLoginScreen(title: 'تأكيد كلمة المرور'),
  StyleLoginScreen(title: 'الدولة'),
];
List<String> countries = [
  'سوريا',
  'السعودية',
  'الإمارات العربية المتحدة',
  'مصر',
  'العراق',
  'الجزائر',
  'الكويت',
];
