import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/init/lang/locale_keys.g.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_architecture_template/core/base/view/base_view.dart';
import '../view_model/test_view_model.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  late TestViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
        onPageBuilder: (context, value) => const Text('data'),
        viewModel: TestViewModel(),
        onModelReady: (model) {
          viewModel = model;
        });
  }

  Widget get scaffoldBody => Scaffold(
        appBar: AppBar(title: const Text(LocaleKeys.welcome).tr()),
        floatingActionButton: floatingActionBtnIncrementModel,
        body: textNumber,
      );

  Widget get textNumber {
    return Observer(builder: (context) => Text(viewModel.number.toString()));
  }

  FloatingActionButton get floatingActionBtnIncrementModel =>
      FloatingActionButton(onPressed: () => viewModel.incrementModel());
}
