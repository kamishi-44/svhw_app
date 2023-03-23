import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/vacation_period.dart';
import '../../repository/homepage_repository.dart';

/// 夏休みが何日経過したのかを表示するインジケーターです。
/// 進捗確認画面で使用し、経過日数 / 夏休みの日数 で進捗度合を
/// 表現します。
class VacationPeriodIndicator extends StatelessWidget {
  const VacationPeriodIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: _indicatorValue(),
    );
  }

  /// 夏休みの経過日数から夏休みがどれくらい経過しているかを
  /// 計算して返します。
  double _indicatorValue() {
    final HomePageRepository homePageRepository = HomePageRepositoryImpl();
    final VacationPeriod period = homePageRepository.vacationPeriod();
    int lapsedDays = DateTime.now().difference(period.startDate).inDays;
    return lapsedDays / period.vacationDays();
  }
}