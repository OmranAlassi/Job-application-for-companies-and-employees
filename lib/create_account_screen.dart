import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs/classes/route_page.dart';
import 'package:jobs/classes/style&create_login_screen.dart';
import 'package:jobs/classes/texthome_screen.dart';
import 'package:jobs/components/app_elevatedbutton.dart';
import 'package:jobs/components/app_textformfiled.dart';
import 'package:jobs/components/custom_container.dart';
import 'package:jobs/components/custom_container2.dart';
import 'package:jobs/components/custom_togglebuttons.dart';

TextEditingController edit1 = TextEditingController();
TextEditingController edit2 = TextEditingController();
TextEditingController edit3 = TextEditingController();
TextEditingController edit4 = TextEditingController();
TextEditingController edit5 = TextEditingController();
TextEditingController edit6 = TextEditingController();
TextEditingController edit7 = TextEditingController();

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool isobscure = true;
  bool isobscure2 = true;
  bool isDropdownSelected = true;
  bool isEmailSelected = true;
  List<bool> isSelected = [true, false];
  int? selectedcountry;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: styles[0].backgroundcolor,
        automaticallyImplyLeading: false,
        toolbarHeight: 5,
      ),
      body: CustomContainer(
        colors: [styles[0].backgroundcolor!, styles[3].backgroundcolor!],
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            Column(
              children: [
                CustomContainer2(
                  borderRadius: BorderRadius.circular(25),
                  margin: EdgeInsets.only(top: 5),
                  height: 885,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      spacing: 15,
                      children: [
                        SizedBox(height: 4),
                        SvgPicture.asset(
                          icons[13],
                          height: 70,
                          // ignore: deprecated_member_use
                          color: styles[0].backgroundcolor,
                        ),
                        Text(
                          styles[4].title!.tr(),
                          style: TextStyle(
                            color: styles[0].backgroundcolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),

                        Text(
                          styles[5].title!.tr(),
                          style: TextStyle(
                            color: styles[0].backgroundcolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),

                        CustomTogglebuttons(
                          isSelected: isSelected,
                          children: [Text('موظف'.tr()), Text('شركة'.tr())],
                          onPressed: (index) {
                            setState(() {
                              for (int i = 0; i < isSelected.length; i++) {
                                isSelected[i] = i == index;
                                isEmailSelected = index == 0;
                                isDropdownSelected = index == 0;
                              }
                            });
                            edit1.clear();
                            edit2.clear();
                            edit3.clear();
                            edit4.clear();
                            edit5.clear();
                            edit6.clear();
                            edit7.clear();
                          },
                        ),
                        isEmailSelected
                            ? AppTextformfiled(
                                controller: edit1,
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
                                    return 'يرجى ملء هذا الحقل'.tr();
                                  }
                                  return null;
                                },
                              )
                            : AppTextformfiled(
                                controller: edit2,
                                prefixIcon: Icon(Icons.abc, size: 30),
                                hintText: Text(
                                  styles[6].title!.tr(),
                                  style: TextStyle(fontSize: 15),
                                ),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'يرجى ملء هذا الحقل'.tr();
                                  }
                                  return null;
                                },
                              ),

                        AppTextformfiled(
                          prefixIcon: Icon(Icons.email_outlined, size: 25),
                          controller: edit3,
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
                        ),

                        AppTextformfiled(
                          controller: edit4,
                          prefixIcon: Icon(Icons.person, size: 25),
                          hintText: Text(
                            styles[7].title!.tr(),
                            style: TextStyle(fontSize: 15),
                          ),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يرجى ملء هذا الحقل'.tr();
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: DropdownButtonFormField<int>(
                            validator: (value) {
                              if (value == null) {
                                return 'يرجى اختيار الدولة'.tr();
                              }
                              return null;
                            },
                            borderRadius: BorderRadius.circular(12),
                            decoration: InputDecoration(
                              label: Text(styles[9].title!.tr()),
                              hintText: 'سوريا'.tr(),
                              prefixIcon: Icon(
                                Icons.location_on_sharp,
                                color: styles[2].backgroundcolor,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              errorStyle: TextStyle(color: Colors.red),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: styles[1].backgroundcolor!,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: styles[0].backgroundcolor!,
                                ),
                              ),
                            ),
                            dropdownColor: Colors.white,
                            items: [
                              DropdownMenuItem(
                                value: 1,
                                child: Text(countries[0].tr()),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text(countries[1].tr()),
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Text(countries[2].tr()),
                              ),
                              DropdownMenuItem(
                                value: 4,
                                child: Text(countries[3].tr()),
                              ),
                            ],
                            onChanged: (value) {
                              selectedcountry = value;
                            },
                          ),
                        ),
                        AppTextformfiled(
                          controller: edit5,
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
                          textInputAction: TextInputAction.done,
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

                        AppTextformfiled(
                          controller: edit6,
                          prefixIcon: Icon(Icons.lock_outline, size: 25),
                          suffixicon: InkWell(
                            onTap: () {
                              setState(() {
                                isobscure2 = !isobscure2;
                              });
                            },
                            child: Icon(
                              isobscure2
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: styles[2].backgroundcolor,
                              size: 25,
                            ),
                          ),
                          hintText: Text(
                            styles[8].title!.tr(),
                            style: TextStyle(fontSize: 15),
                          ),
                          textInputAction: TextInputAction.go,
                          keyboardType: TextInputType.visiblePassword,

                          obscureText: isobscure2,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يرجى ملء هذا الحقل'.tr();
                            }
                            if (edit5.text != value) {
                              return 'كلمة المرور ليست مطابقة'.tr();
                            }
                            return null;
                          },
                        ),

                        AppElevatedbutton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, RoutePage.login);
                              edit1.clear();
                              edit2.clear();
                              edit3.clear();
                              edit4.clear();
                              edit5.clear();
                              edit6.clear();
                              edit7.clear();
                            }
                          },
                          title: styles[4].title!.tr(),
                          elevation: 3,
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.75,
                            52,
                          ),
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
