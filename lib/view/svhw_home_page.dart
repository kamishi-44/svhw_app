import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svhw_app/provider/provider.dart';
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

  /// コンストラクタ
  const SvhwHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectPage = ref.watch(AppProvider.selectPageProvider);
    return Scaffold(
      body: _pages[selectPage],
      bottomNavigationBar: const HomePageBottomNavigationBar(),
    );
  }

}