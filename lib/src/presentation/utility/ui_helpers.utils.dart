import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChannels;

///To remove focus from elements like buttons, input elements in general e.g
///textfields and also close keyboards
void removePrimaryFocusFromUiElement(BuildContext context) {
  final currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }

  hideOSKeyboard();
}

Future<void> hideOSKeyboard() async {
  await SystemChannels.textInput.invokeMethod('TextInput.hide');
}
