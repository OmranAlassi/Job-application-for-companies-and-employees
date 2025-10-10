import 'package:flutter/material.dart';
import 'package:jobs/core/const/app_colors.dart';

class AddjobsScreen extends StatefulWidget {
  const AddjobsScreen({super.key});

  @override
  State<AddjobsScreen> createState() => _AddjobsScreenState();
}

class _AddjobsScreenState extends State<AddjobsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColor.white2);
  }
}
