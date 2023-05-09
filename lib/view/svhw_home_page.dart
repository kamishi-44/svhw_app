import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svhw_app/view/home_page.dart';
import 'package:svhw_app/view/parts/bottom_navigation_bar.dart';
import 'package:svhw_app/view/register_progress_page.dart';

/// 宿題の進捗確認のホーム画面です。
class SvhwHomePage extends ConsumerWidget {
  /// ボトムナビゲーションバーで遷移するページのリスト
  static const List<Widget> _pages = [
    HomePage(),
    RegisterProgressPage()
  ];

  /// 選択中のページ
  /// TODO:Providerで管理したほうがいいかも
  int _selectPage = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: _pages[_selectPage],
      bottomNavigationBar: const HomePageBottomNavigationBar(),
    );
  }

}