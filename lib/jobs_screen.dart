import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jobs/classes/style&create_login_screen.dart';
import 'package:jobs/classes/texthome_screen.dart';
import 'package:jobs/components/app_searchtextformfiled.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  List<ApptextScreen> results2 = [];
  @override
  void initState() {
    super.initState();
    results2 = texts4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: styles[4].backgroundcolor,
      body: Column(
        children: [
          AppSearchtextformfiled(
            onChanged: (value) {
              setState(() {
                results2 = texts4.where((item) {
                  return item.name!.tr().toLowerCase().contains(
                    value.toLowerCase(),
                  );
                }).toList();
              });
            },
            hintText: Text('ابحث في وظائفك'.tr()),
            keyboardType: TextInputType.webSearch,
            textInputAction: TextInputAction.search,
            prefixIcon: Icon(Icons.search),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Text(
                  'وظائف شركتي'.tr(),
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
            child: results2.isEmpty
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
                    itemCount: results2.length,
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
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: CircleAvatar(
                                backgroundColor: styles[0].backgroundcolor,
                                radius: 25,
                                child: Icon(
                                  Icons.work,
                                  color: styles[4].backgroundcolor,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.54,
                                  child: Text(results2[index].name!.tr()),
                                ),
                                Text(texts3[index].name!.tr()),
                                Text(texts5[index].name!.tr()),
                                Row(
                                  spacing: 5,
                                  children: [
                                    Icon(Icons.location_on, size: 16),
                                    Text('سوريا'.tr()),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.more_vert_outlined),
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
