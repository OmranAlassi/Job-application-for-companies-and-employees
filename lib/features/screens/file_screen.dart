import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs/core/const/app_colors.dart';
import 'package:jobs/core/const/app_icons.dart';
import 'package:jobs/core/const/app_strings.dart';
import 'package:jobs/features/auth/presentation_layer/widgets/custom_container.dart';

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
      backgroundColor: AppColor.white2,
      body: Column(
        children: [
          Center(
            child: CustomContainer(
              height: 270,
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 0.48,
              borderRadius: BorderRadius.circular(18),
              colors: [AppColor.tealAccent, AppColor.tealAccent],
              child: Column(
                spacing: 12,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: CircleAvatar(
                      radius: 65,
                      backgroundColor: AppColor.teal,
                      child: SvgPicture.asset(
                        AppIcons.company2,
                        // ignore: deprecated_member_use
                        color: AppColor.white2,
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
                    color: AppColor.white2,
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
                        child: appicons[index],
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
