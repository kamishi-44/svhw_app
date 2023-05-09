import 'package:flutter/material.dart';
import 'package:svhw_app/constant/constant.dart';

/// ホームページで使用するボトムナビゲーションバーです。
class HomePageBottomNavigationBar extends StatelessWidget {
  const HomePageBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: Constant.homeMessage),
      BottomNavigationBarItem(icon: Icon(Icons.add_task_rounded), label: Constant.registerMessage),
    ],
    );
  }
}
