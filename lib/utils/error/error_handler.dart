import 'package:xatter/utils/error/xatter_error.dart';

class ErrorHandler {
  ErrorHandler();

  void handle(dynamic error) {
    // grava erro no crashlytics + stacktrace

    if (error is XatterError) {
      // mostra snackbar com mensagem de erro do usuário
    } else {
      // mostra snackbar com error.toString()
    }
  }
}
