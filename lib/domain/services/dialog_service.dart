import 'package:flutter/cupertino.dart';
import 'package:template/data/models/models.dart';
import 'package:template/presentation/theme/app_typography.dart';

class DialogService {
  DialogService(this._context);

  final BuildContext _context;

  Future<void> showError({
    String? title,
    String? text,
  }) async {
    return await showCupertinoDialog(
      context: _context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          title ?? 'Ошибка',
          style: AppTypography.sf.s18.w600.red,
        ),
        content: Text(
          text ?? 'Неизвестная ошибка',
          style: AppTypography.sf.s14.w500.black,
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            isDefaultAction: true,
            child: const Text('Окей'),
          ),
        ],
      ),
    );
  }

  Future<void> showBackendError({
    CoreError? error,
  }) async {
    return await showCupertinoDialog(
      context: _context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          error?.message ?? 'Ошибка',
          style: AppTypography.sf.s18.w600.red,
        ),
        content: Text(
          error?.exception?.exception ?? 'Неизвестная ошибка',
          style: AppTypography.sf.s14.w500.black,
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            isDefaultAction: true,
            child: const Text('Окей'),
          ),
        ],
      ),
    );
  }

  Future<void> showInfoDialog({
    String? title,
    required String text,
  }) async {
    return await showCupertinoDialog(
      context: _context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          title ?? 'Справка',
          style: AppTypography.sf.s18.w600.blue,
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            text,
            style: AppTypography.sf.s14.w500.black,
          ),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            isDefaultAction: true,
            child: const Text('Окей'),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showCallbackDialog({
    required Widget Function(BuildContext context) builder,
  }) async {
    return await showCupertinoDialog(
      barrierDismissible: true,
      context: _context,
      builder: builder,
    );
  }
}
