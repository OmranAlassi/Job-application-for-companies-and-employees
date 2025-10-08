import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs/addjobs_screen.dart';
import 'package:jobs/classes/route_page.dart';
import 'package:jobs/classes/style&create_login_screen.dart';
import 'package:jobs/classes/texthome_screen.dart';
import 'package:jobs/file_screen.dart';
import 'package:jobs/home_screen.dart';
import 'package:jobs/jobs_screen.dart';

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
        backgroundColor: styles[4].backgroundcolor,
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
                      backgroundColor: styles[0].backgroundcolor,
                      radius: 32,
                      child: Icon(
                        Icons.person,
                        color: styles[4].backgroundcolor,
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
                leading: SvgPicture.asset(icons[10]),
                title: Text('الأعدادت'.tr()),
              ),

              ListTile(
                leading: SvgPicture.asset(icons[11], height: 22),
                title: Text('الحساب'.tr()),
              ),

              ListTile(
                leading: SvgPicture.asset(icons[12], height: 22),
                title: Text('معلومات عنا'.tr()),
              ),

              ListTile(
                leading: SvgPicture.asset(
                  icons[4],
                  height: 22,
                  // ignore: deprecated_member_use
                  color: styles[0].backgroundcolor,
                ),
                title: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, RoutePage.login);
                  },
                  child: Text('تسجيل خروج'.tr()),
                ),
              ),
              ListTile(
                leading: Icon(Icons.language, color: styles[2].backgroundcolor),
                title: Text('اللغة'.tr()),
              ),
              RadioListTile<String>(
                title: Text('English'),
                value: 'en',
                groupValue: selectedLanguage,
                activeColor: styles[0].backgroundcolor,
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
                activeColor: styles[0].backgroundcolor,
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
        backgroundColor: styles[4].backgroundcolor,
        elevation: 0,
        scrolledUnderElevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey.withValues(alpha: 0.2)),
          borderRadius: BorderRadiusGeometry.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),

        title: Text(
          'لوحة الشركة'.tr(),
          style: TextStyle(color: styles[0].backgroundcolor),
        ),
        centerTitle: true,
        actionsPadding: EdgeInsets.only(right: 5),
        actionsIconTheme: IconThemeData(color: styles[0].backgroundcolor),
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
              backgroundColor: styles[4].backgroundcolor,
              selectedItemColor: styles[0].backgroundcolor,
              selectedFontSize: 12,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              unselectedLabelStyle: TextStyle(
                fontSize: 10,
                color: styles[2].backgroundcolor,
              ),
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedIconTheme: IconThemeData(
                color: styles[2].backgroundcolor,
              ),
              iconSize: 30,
              unselectedItemColor: styles[2].backgroundcolor,
              items: [
                BottomNavigationBarItem(
                  icon: (SvgPicture.asset(icons[1], height: 28)),
                  activeIcon: SvgPicture.asset(
                    icons[0],
                    height: 28,
                    // ignore: deprecated_member_use
                    color: styles[0].backgroundcolor,
                  ),
                  label: 'الباحثين عن عمل'.tr(),
                ),
                BottomNavigationBarItem(
                  icon: (SvgPicture.asset(icons[3], height: 28)),
                  activeIcon: SvgPicture.asset(
                    icons[2],
                    height: 28,
                    // ignore: deprecated_member_use
                    color: styles[0].backgroundcolor,
                  ),
                  label: 'وظائفي'.tr(),
                ),

                BottomNavigationBarItem(
                  icon: (SvgPicture.asset(icons[5], height: 28)),

                  activeIcon: SvgPicture.asset(
                    icons[6],
                    // ignore: deprecated_member_use
                    color: styles[0].backgroundcolor,
                    height: 28,
                  ),

                  label: 'إضافة وظيفة'.tr(),
                ),

                BottomNavigationBarItem(
                  icon: (SvgPicture.asset(icons[7], height: 25)),
                  activeIcon: SvgPicture.asset(
                    icons[8],
                    height: 25,
                    // ignore: deprecated_member_use
                    color: styles[0].backgroundcolor,
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
