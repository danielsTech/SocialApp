import 'package:logger/logger.dart';
import 'package:social_app/app/data/enums.dart';

void infoLog(String input, CONSOLE_LOG_TYPE logType) {
  final Logger _logger = Logger();

  switch (logType) {
    case CONSOLE_LOG_TYPE.INFO:
      _logger.i(input);
      break;
    case CONSOLE_LOG_TYPE.DEBUG:
      _logger.d(input);
      break;
    case CONSOLE_LOG_TYPE.ERROR:
      _logger.e(input);
      break;
    case CONSOLE_LOG_TYPE.WARNING:
      _logger.w(input);
      break;
    default:
      _logger.i(input);
  }
}
