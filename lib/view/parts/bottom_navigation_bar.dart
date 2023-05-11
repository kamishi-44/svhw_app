import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svhw_app/constant/constant.dart';

import '../../constant/colors.dart';
import '../../provider/provider.dart';

/// ホームページで使用するボトムナビゲーションバーです。
class HomePageBottomNavigationBar extends ConsumerWidget {
  const HomePageBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectPage = ref.watch(AppProvider.selectPageProvider);

    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.shifting,
      currentIndex: selectPage,
      onTap: (index) => ref
          .read(AppProvider.selectPageProvider.notifier)
          .update((_) => index),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            backgroundColor: AppColor.mainColor,
            icon: Icon(Icons.home_rounded), label: Constant.homeMessage),
        BottomNavigationBarItem(
            backgroundColor: AppColor.mainColor,
            icon: Icon(Icons.add_task_rounded),
            label: Constant.registerMessage),
      ],
    );
  }
}
