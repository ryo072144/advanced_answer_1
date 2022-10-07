import 'package:advanced_exercise_1/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//問２：　リストの要素を文字列からThemaDataに変更する。
List<ThemeData> list = [ThemeData.light(), ThemeData.dark()];

class Setting extends ConsumerWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final theme = ref.watch(themeProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        centerTitle: true,
      ),
      body: Center(

        //問２：　ドロップダウンメニューでテーマを切り替える。
        child: DropdownButton<ThemeData>(
          //問２：　valueはthemProviderの状態を参照する。
          value: theme.state,
          elevation: 16,
          underline: Container(
            height: 2,
          ),
          onChanged: (ThemeData? value) {
            theme.state = value!;
          },
          items: list.map<DropdownMenuItem<ThemeData>>((ThemeData value) {
            return DropdownMenuItem<ThemeData>(
              value: value,
              child: Text(value==ThemeData.light()?'ライトテーマ':'ダークテーマ'),
            );
          }).toList(),
        ),
      )
    );
  }
}
