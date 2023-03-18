import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/domain/di/core/app_dependency_widget.dart';
import 'package:template/domain/di/user_dependency.dart';

import 'root_vm.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppDependencyWidget<UserDependency>(
      create: UserDependency.new,
      dispose: (_, dep) => dep.dispose(),
      loadingBuilder: (context) => const Scaffold(
        body: CupertinoActivityIndicator(),
      ),
      child: ViewModelBuilder<RootViewModel>.reactive(
        viewModelBuilder: () => RootViewModel(),
        onModelReady: (model) => model.onReady(),
        builder: (context, model, child) {
          return Scaffold();
        },
      ),
    );
  }
}
