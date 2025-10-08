import 'package:flutter/material.dart';
import 'package:jobs/classes/style&create_login_screen.dart';

class AddjobsScreen extends StatefulWidget {
  const AddjobsScreen({super.key});

  @override
  State<AddjobsScreen> createState() => _AddjobsScreenState();
}

class _AddjobsScreenState extends State<AddjobsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: styles[4].backgroundcolor);
  }
}
