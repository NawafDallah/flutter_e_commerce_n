import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';


import '../../config/routes/routes.dart';
import '../../core/cubits/middleware/middleware_cubit.dart';
import '../../init_dependencies.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({
    super.key,
    required this.title,
    required this.defaultText,
    required this.destructiveText,
  });

  final String title;
  final String defaultText;
  final String destructiveText;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutBack,
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (_, value, child) {
        return Transform.scale(
          scale: value,
          child: child!,
        );
      },
      child: CupertinoAlertDialog(
        title: Text(title),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(defaultText),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            isDestructiveAction: true,
            onPressed: () {
              context
                  .read<MiddlewareCubit>()
                  .changeMiddleWarePage(Routes.login);
              sl<Box>().clear();
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.login,
                (route) => false,
              );
            },
            child: Text(destructiveText),
          ),
        ],
      ),
    );
  }
}
