import 'package:flutter/services.dart';

class TimeFormatter extends TextInputFormatter {
  /// The callback for when the time format should be changed.
  final VoidCallback? formatChanged;

  TimeFormatter({this.formatChanged});

  @override
  TextEditingValue formatEditUpdate(
    final TextEditingValue oldValue,
    final TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;
    final int? value = int.tryParse(newValue.text);
    if (value == null) return oldValue;
    if (value == 0) return const TextEditingValue(text: "12");
    if (value > 24) return oldValue;
    if (value > 12) {
      formatChanged?.call();
      return TextEditingValue(
        text: (value - 12).toString(),
      );
    }
    return newValue;
  }
}
