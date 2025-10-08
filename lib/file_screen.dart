import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs/classes/style&create_login_screen.dart';
import 'package:jobs/classes/texthome_screen.dart';
import 'package:jobs/components/custom_container.dart';

class FileScreen extends StatefulWidget {
  const FileScreen({super.key});

  @override
  State<FileScreen> createState() => _FileScreenState();
}

class _FileScreenState extends State<FileScreen> {
  int? number;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: styles[4].backgroundcolor,
      body: Column(
        children: [
          Center(
            child: CustomContainer(
              height: 270,
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 0.48,
              borderRadius: BorderRadius.circular(18),
              colors: [styles[3].backgroundcolor!, styles[3].backgroundcolor!],
              child: Column(
                spacing: 12,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: CircleAvatar(
                      radius: 65,
                      backgroundColor: styles[0].backgroundcolor,
                      child: SvgPicture.asset(
                        icons[8],
                        // ignore: deprecated_member_use
                        color: styles[4].backgroundcolor,
                        height: 65,
                      ),
                    ),
                  ),

                  Text(
                    'Google'.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),

                  Text(
                    'شركة'.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: works.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(16),
                  height: 70,
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
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: works3[index],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 18),
                          Text(works[index].name!.tr()),
                          Text(works2[index].name!.tr()),
                        ],
                      ),
                      Spacer(),
                      Text(index == 3 ? '${number ?? 0}' : ''),
                      SizedBox(width: 15),
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
