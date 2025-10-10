import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs/common/widgets/screens/addjobs_screen.dart';
import 'package:jobs/core/const/app_colors.dart';
import 'package:jobs/core/const/app_icons.dart';
import 'package:jobs/core/const/app_strings.dart';
import 'package:jobs/core/routes/route_manager.dart';
import 'package:jobs/common/widgets/screens/file_screen.dart';
import 'package:jobs/features/home/home_screen.dart';
import 'package:jobs/common/widgets/screens/jobs_screen.dart';

class SuperhomeScreen extends StatefulWidget {
  const SuperhomeScreen({super.key});

  @override
  State<SuperhomeScreen> createState() => _SuperhomeScreenState();
}

class _SuperhomeScreenState extends State<SuperhomeScreen> {
  int selectedindex = 0;
  String selectedLanguage = 'en';
  List<Widget> pages = [
    HomeScreen(),
    JobsScreen(),
    AddjobsScreen(),
    FileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.77,
        backgroundColor: AppColor.white2,
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColor.teal,
                      radius: 32,
                      child: Icon(
                        Icons.person,
                        color: AppColor.white2,
                        size: 30,
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(texts[0].name!),
                        subtitle: Text(texts2[0].name!),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: SvgPicture.asset(AppIcons.setting),
                title: Text('الأعدادت'.tr()),
              ),

              ListTile(
                leading: SvgPicture.asset(AppIcons.account, height: 22),
                title: Text('الحساب'.tr()),
              ),

              ListTile(
                leading: SvgPicture.asset(AppIcons.about, height: 22),
                title: Text('معلومات عنا'.tr()),
              ),

              ListTile(
                leading: SvgPicture.asset(
                  AppIcons.logout1,
                  height: 22,
                  // ignore: deprecated_member_use
                  color: AppColor.teal,
                ),
                title: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, RoutePage.login);
                  },
                  child: Text('تسجيل خروج'.tr()),
                ),
              ),
              ListTile(
                leading: Icon(Icons.language, color: AppColor.gray),
                title: Text('اللغة'.tr()),
              ),
              RadioListTile<String>(
                title: Text('English'),
                value: 'en',
                groupValue: selectedLanguage,
                activeColor: AppColor.teal,
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value!;
                    context.setLocale(Locale('en'));
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('العربية'),
                value: 'ar',
                groupValue: selectedLanguage,
                activeColor: AppColor.teal,
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value!;
                    context.setLocale(Locale('ar'));
                  });
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColor.white2,
        elevation: 0,
        scrolledUnderElevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey.withValues(alpha: 0.2)),
          borderRadius: BorderRadiusGeometry.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),

        title: Text('لوحة الشركة'.tr(), style: TextStyle(color: AppColor.teal)),
        centerTitle: true,
        actionsPadding: EdgeInsets.only(right: 5),
        actionsIconTheme: IconThemeData(color: AppColor.teal),
      ),
      body: pages[selectedindex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.4),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              backgroundColor: AppColor.white2,
              selectedItemColor: AppColor.teal,
              selectedFontSize: 12,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              unselectedLabelStyle: TextStyle(
                fontSize: 10,
                color: AppColor.gray,
              ),
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedIconTheme: IconThemeData(color: AppColor.gray),
              iconSize: 30,
              unselectedItemColor: AppColor.gray,
              items: [
                BottomNavigationBarItem(
                  icon: (SvgPicture.asset(AppIcons.group2, height: 28)),
                  activeIcon: SvgPicture.asset(
                    AppIcons.group1,
                    height: 28,
                    // ignore: deprecated_member_use
                    color: AppColor.teal,
                  ),
                  label: 'الباحثين عن عمل'.tr(),
                ),
                BottomNavigationBarItem(
                  icon: (SvgPicture.asset(AppIcons.job2, height: 28)),
                  activeIcon: SvgPicture.asset(
                    AppIcons.job1,
                    height: 28,
                    // ignore: deprecated_member_use
                    color: AppColor.teal,
                  ),
                  label: 'وظائفي'.tr(),
                ),

                BottomNavigationBarItem(
                  icon: (SvgPicture.asset(AppIcons.add1, height: 28)),

                  activeIcon: SvgPicture.asset(
                    AppIcons.add2,
                    // ignore: deprecated_member_use
                    color: AppColor.teal,
                    height: 28,
                  ),

                  label: 'إضافة وظيفة'.tr(),
                ),

                BottomNavigationBarItem(
                  icon: (SvgPicture.asset(AppIcons.company1, height: 25)),
                  activeIcon: SvgPicture.asset(
                    AppIcons.company2,
                    height: 25,
                    // ignore: deprecated_member_use
                    color: AppColor.teal,
                  ),
                  label: 'الملف'.tr(),
                ),
              ],
              currentIndex: selectedindex,
              onTap: (index) {
                setState(() {
                  selectedindex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
