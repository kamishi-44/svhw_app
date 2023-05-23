import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:svhw_app/constant/constant.dart';
import 'package:svhw_app/provider/provider.dart';
import 'package:svhw_app/view/page_util.dart';
import 'package:svhw_app/view/parts/dropdown_button.dart';

import '../model/homework.dart';
import 'home_page.dart';

/// 夏休みの宿題を登録する画面です。
/// 夏休みの情報を登録するときにだけ遷移できる画面で
/// 夏休みの期間登録画面から遷移します。
class RegisterHomeworkPage extends ConsumerWidget {
  const RegisterHomeworkPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Homework> homeworks = ref.watch(AppProvider.homeworksProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constant.registerHomeworkPageTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Constant.vacationPeriodPageVerticalPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SlidableAutoCloseBehavior(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: homeworks.length,
                  itemBuilder: (BuildContext context, int index) {
                    Homework homework = homeworks[index];

                    return Slidable(
                        key: UniqueKey(),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                ref
                                    .read(
                                        AppProvider.homeworksProvider.notifier)
                                    .removeHomeWork(homework.id);
                              },
                              flex: 2,
                              backgroundColor: const Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                            ),
                          ],
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            homework.subject,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ));
                  }),
            ),
            const _SelectHomeworkDialogButton(),
            PageUtil.getSizedBox(),
            Container(
              margin: const EdgeInsets.only(left: 250.0),
              child: ElevatedButton(
                  // 登録タップ時に宿題、期間のデータ登録
                  onPressed: () {
                    ref
                        .read(AppProvider.periodProvider.notifier)
                        .insertPeriod();
                    ref
                        .read(AppProvider.homeworksProvider.notifier)
                        .insertHomeworks();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const HomePage()));
                  },
                  child: const Text(Constant.registerMessage)),
            ),
          ],
        ),
      ),
    );
  }
}

/// 追加する宿題を選択するダイアログを開くボタンです。
class _SelectHomeworkDialogButton extends ConsumerWidget {
  const _SelectHomeworkDialogButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(Constant.selectHomeworkMessage),
          content: SizedBox(
            height: 150,
            child: Column(

              children: [
                const SubjectDropdownButton(),
                const HomeworkTypeDropdownButton(),
                Row(
                   mainAxisAlignment:  MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 55,
                        height: 30,
                        child: TextField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        )),
                    const Text(Constant.unitsMessage),
                  ],
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, Constant.cancelMessage),
              child: const Text(Constant.cancelMessage),
            ),
            TextButton(
              onPressed: () {
                final String selectSubject =
                    ref.read(AppProvider.selectSubjectProvider);
                final HomeworkType selectType =
                    ref.read(AppProvider.selectTypeProvider);
                ref.read(AppProvider.homeworksProvider.notifier).addHomeWork(
                    Homework(
                        subject: selectSubject,
                        homeworkType: selectType.typeInt));
                Navigator.pop(context, Constant.addMessage);
              },
              child: const Text(Constant.addMessage),
            ),
          ],
        ),
      ),
      child: const Text(
        '${Constant.addSubjectMessage}  +',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  /// 宿題の種類にあった単位を取得します。
  String _getHomeworkUnits(WidgetRef ref) {
    final HomeworkType selectType = ref.watch(AppProvider.selectTypeProvider);

    switch (selectType) {
      case HomeworkType.print:
        return '枚';
      case HomeworkType.text:
        return 'P';
    }
  }
}
