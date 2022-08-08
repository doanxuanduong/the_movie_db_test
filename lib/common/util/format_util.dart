import 'package:intl/intl.dart';

class FormatUtils {

  /// yyyy-MM-ddTHH:mm:ss => yyyy
  static dynamic convertDateTime(
      String? input, {
        bool outputDateTime = false,
        String? format,
        String? formatOutput,
      }) {
    if (input?.isEmpty ?? true) {
      return null;
    }
    DateFormat dateFormat = DateFormat(format ?? "yyyy-MM-dd");
    DateFormat dateFormatText = DateFormat("yyyy");
    DateTime dateTime = dateFormat.parse(input!);
    if (outputDateTime == true) {
      return dateTime;
    }
    return formatOutput != null
        ? DateFormat(formatOutput).format(dateTime)
        : dateFormatText.format(dateTime);
  }

}
