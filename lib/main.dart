import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svhw_app/constant/colors.dart';
import 'package:svhw_app/constant/constant.dart';
import 'package:svhw_app/view/register_homework_page.dart';
import 'package:svhw_app/view/svhw_home_page.dart';
import 'package:svhw_app/view/vacation_period_page.dart';

import 'objectbox.g.dart';

/// ObjectBoxのストア
late Store store;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  store = await openStore();

  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Summer Homework',
      theme: ThemeData(
        primarySwatch: AppColor.mainColor,
      ),
      home: const MyHomePage(title: 'SVHW Home Page'),
      localizationsDelegates: Constant.localizationsDelegates,
      supportedLocales: Constant.supportedLocales,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: testPageTransitionButtons(context),
        ),
      ),
    );
  }

  /// 画面実装時の各画面確認用の遷移ボタンを取得します。
  /// 各画面の実装や遷移、制御が実装出来次第削除します。
  List<Widget> testPageTransitionButtons(BuildContext context) {
    return <Widget>[
      OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const VacationPeriodPage()));
          },
          child: const Text('夏休みの期間登録画面')),
      OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    const RegisterHomeworkPage()));
          },
          child: const Text('宿題内容登録画面')),
      OutlinedButton(
          onPressed: () {
            null;
          },
          child: const Text('宿題の進捗登録画面')),
      OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                const SvhwHomePage()));
          },
          child: const Text('宿題の進捗確認画面')),
    ];
  }
}
