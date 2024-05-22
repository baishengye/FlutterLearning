import '../event/http_error_event.dart';
import '../event/index.dart';

///错误编码
class Code {
  ///网络错误
  static const NETWORK_ERROR = -1;

  static errorHandleFunction(code, message, noTip) {
    if (noTip) {
      return message;
    }
    eventBus.fire(HttpErrorEvent(code, message));
    return message;
  }
}
