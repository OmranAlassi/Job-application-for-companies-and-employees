import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs/classes/route_page.dart';
import 'package:jobs/classes/style&create_login_screen.dart';
import 'package:jobs/classes/texthome_screen.dart';
import 'package:jobs/components/app_elevatedbutton.dart';
import 'package:jobs/components/custom_container.dart';
import 'package:jobs/components/custom_container2.dart';
import 'package:jobs/components/app_textformfiled.dart';
import 'package:jobs/components/custom_togglebuttons.dart';

TextEditingController text1 = TextEditingController();
TextEditingController text2 = TextEditingController();
TextEditingController text3 = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isobscure = true;
  bool isEmailSelected = true;
  List<bool> isSelected = [true, false];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomContainer(
        colors: [styles[0].backgroundcolor!, styles[3].backgroundcolor!],
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              CustomContainer2(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                margin: EdgeInsets.only(top: 135),
                height: 210,
                child: Column(
                  spacing: 10,
                  children: [
                    SizedBox(),
                    SvgPicture.asset(
                      icons[13],
                      height: 70,
                      // ignore: deprecated_member_use
                      color: styles[0].backgroundcolor,
                    ),
                    Text(
                      styles[0].title!.tr(),
                      style: TextStyle(
                        color: styles[0].backgroundcolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    CustomTogglebuttons(
                      isSelected: isSelected,
                      children: [
                        Text('بالبريد الإلكتروني'.tr()),
                        Text('باسم المستخدم'.tr()),
                      ],
                      onPressed: (index) {
                        setState(() {
                          for (int i = 0; i < isSelected.length; i++) {
                            isSelected[i] = i == index;
                            isEmailSelected = index == 0;
                            index == 1 ? text1.clear() : text2.clear();
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),

              CustomContainer2(
                height: 310,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      spacing: 10,
                      children: [
                        isEmailSelected
                            ? AppTextformfiled(
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  size: 25,
                                ),
                                controller: text1,
                                hintText: Text(
                                  styles[1].title!.tr(),
                                  style: TextStyle(fontSize: 15),
                                ),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'يرجى ملء هذا الحقل'.tr();
                                  }
                                  final emailRegex = RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                  );

                                  if (!emailRegex.hasMatch(value)) {
                                    return 'يرجى إدخال بريد إلكتروني صالح مثل example@domain.com'
                                        .tr();
                                  }
                                  return null;
                                },
                              )
                            : AppTextformfiled(
                                controller: text2,
                                prefixIcon: Icon(
                                  Icons.person_outline_outlined,

                                  size: 25,
                                ),
                                hintText: Text(
                                  styles[3].title!.tr(),
                                  style: TextStyle(fontSize: 15),
                                ),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'يرجى ملء هذا الحقل '.tr();
                                  }
                                  return null;
                                },
                              ),

                        AppTextformfiled(
                          controller: text3,
                          prefixIcon: Icon(Icons.lock_outline, size: 25),
                          suffixicon: InkWell(
                            onTap: () {
                              setState(() {
                                isobscure = !isobscure;
                              });
                            },
                            child: Icon(
                              isobscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: styles[2].backgroundcolor,
                              size: 25,
                            ),
                          ),
                          hintText: Text(
                            styles[2].title!.tr(),
                            style: TextStyle(fontSize: 15),
                          ),
                          textInputAction: TextInputAction.go,
                          keyboardType: TextInputType.visiblePassword,

                          obscureText: isobscure,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يرجى ملء هذا الحقل'.tr();
                            }
                            if (value.length < 10) {
                              return 'كلمة المرور ليست قوية ادخل رموز وأرقام'
                                  .tr();
                            }
                            return null;
                          },
                        ),

                        Row(
                          spacing: 5,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'نسيت كلمة السر؟'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: styles[0].backgroundcolor,
                                fontSize: 15,
                              ),
                            ),

                            InkWell(
                              onTap: () {},
                              child: Text(
                                'إعادة تعيين كلمة السر'.tr(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: styles[0].backgroundcolor,
                                  decoration: TextDecoration.underline,
                                  decorationColor: styles[0].backgroundcolor,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(),
                        AppElevatedbutton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, RoutePage.superhome);
                              text3.clear();
                            }
                          },
                          title: styles[0].title!.tr(),
                          elevation: 3,
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.75,
                            52,
                          ),
                          fontSize: 16,
                        ),
                        SizedBox(height: 2),
                        Row(
                          spacing: 5,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ليس لديك حساب؟'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: styles[0].backgroundcolor,
                                fontSize: 15,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RoutePage.createaccount,
                                );
                              },
                              child: Text(
                                'إنشاء حساب جديد'.tr(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: styles[0].backgroundcolor,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
