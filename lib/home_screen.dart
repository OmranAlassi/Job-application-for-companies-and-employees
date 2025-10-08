import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jobs/classes/style&create_login_screen.dart';
import 'package:jobs/classes/texthome_screen.dart';
import 'package:jobs/components/app_elevatedbutton.dart';
import 'package:jobs/components/app_searchtextformfiled.dart';

TextEditingController search1 = TextEditingController();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ApptextScreen> results = [];

  @override
  void initState() {
    super.initState();
    results = texts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: styles[4].backgroundcolor,
      body: Column(
        spacing: 5,
        children: [
          AppSearchtextformfiled(
            onChanged: (value) {
              setState(() {
                results = texts.where((item) {
                  return item.name!.tr().toLowerCase().contains(
                    value.toLowerCase(),
                  );
                }).toList();
              });
            },
            hintText: Text('أبحث عن موظف'.tr()),
            keyboardType: TextInputType.webSearch,
            textInputAction: TextInputAction.search,
            prefixIcon: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Text(
                  'الباحثين عن عمل في سوريا'.tr(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: styles[0].backgroundcolor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: results.isEmpty
                ? Center(
                    child: Text(
                      'لا توجد نتائج'.tr(),
                      style: TextStyle(
                        fontSize: 18,
                        color: styles[2].backgroundcolor,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(16),
                        height: 110,
                        decoration: BoxDecoration(
                          color: styles[4].backgroundcolor,

                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.8),
                              blurRadius: 4,
                              offset: Offset(0, 6),
                              blurStyle: BlurStyle.outer,
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Row(
                          spacing: 12,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: CircleAvatar(
                                backgroundColor: styles[0].backgroundcolor,
                                radius: 22,
                                child: Icon(
                                  Icons.person,
                                  color: styles[4].backgroundcolor,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(results[index].name!.tr()),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(texts2[index].name!.tr()),
                                ),
                                Row(
                                  spacing: 5,
                                  children: [
                                    Icon(Icons.location_on, size: 16),
                                    Text('سوريا'.tr()),
                                  ],
                                ),
                              ],
                            ),
                            AppElevatedbutton(
                              onPressed: () {},
                              title: 'تواصل'.tr(),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
