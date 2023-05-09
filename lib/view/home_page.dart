import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svhw_app/model/homework.dart';
import 'package:svhw_app/model/vacation_period.dart';
import 'package:svhw_app/repository/homepage_repository.dart';
import 'package:svhw_app/view/parts/icon.dart';
import 'package:svhw_app/view/parts/progress_indicator.dart';

/// 現在の宿題の状況を確認できるページです。
/// 宿題が既に登録されている場合は最初に表示されるページになります。
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomePageRepository homePageRepository = HomePageRepositoryImpl();
    final VacationPeriod period = homePageRepository.vacationPeriod();
    final List<Homework> homeworks = homePageRepository.registeredHomeworks();

    return Scaffold(
      appBar: AppBar(
        title: const Text('宿題の進捗確認画面'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                      width: 300,
                      child: VacationPeriodIndicator()),
                  Flexible(
                      child: Container(
                          alignment: Alignment.center,
                          child: const WeatherIcon())),
                ],
              ),
              Text('夏休みの始まり -> ${period.dispStartDate}'),
              Text('夏休みの終わり -> ${period.dispEndDate}'),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: homeworks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(homeworks[index].subject);
                  })
            ],
          ),
        ),
      ),
      // ボトムナビゲーションバーを追加
    );
  }
}
