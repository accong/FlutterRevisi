import 'dart:ui' show ImageFilter;

import 'package:flutter/cupertino.dart'
    show
    Alignment,
    Border,
    BorderSide,
    BoxDecoration,
    BuildContext,
    Color,
    Column,
    Container,
    CrossAxisAlignment,
    CupertinoButton,
    CupertinoDatePicker,
    CupertinoDatePickerMode,
    CupertinoIcons,
    CupertinoTheme,
    EdgeInsets,
    Expanded,
    FontWeight,
    Icon,
    Key,
    MainAxisAlignment,
    MediaQuery,
    Navigator,
    Row,
    SizedBox,
    Text,
    Widget,
    showCupertinoModalPopup,
    DatePickerDateOrder;
import 'package:flutter/material.dart' show Color, Colors;

export 'dart:ui' show ImageFilter;

export 'package:flutter/material.dart' show Color, Colors;

void showCupertinoDatePicker(BuildContext context, {
  Key? key,
  CupertinoDatePickerMode mode = CupertinoDatePickerMode.dateAndTime,
  required Function(DateTime? value) onDateTimeSelected,
  required Function(DateTime? value) onDateTimeChanged,
  DateTime? initialDateTime,
  DateTime? minimumDate,
  DateTime? maximumDate,
  int minimumYear = 1,
  int? maximumYear,
  int minuteInterval = 1,
  bool use24hFormat = false,
  Color? backgroundColor = const Color.fromRGBO(249, 249, 247, 1.0),
  ImageFilter? filter,
  bool useRootNavigator = true,
  bool? semanticsDismissible,
  Widget? cancelText,
  Widget? doneText,
  bool useText = false,
  bool leftHanded = false,
  DatePickerDateOrder? dateOrder,
}) {
  // Default to right now.
  initialDateTime ??= DateTime.now();
  DateTime? selectedDateTime;
  if (!useText) {
    cancelText = const Icon(CupertinoIcons.clear_circled);
  } else {
    cancelText ??= Text(
      'Cancel',
      style: CupertinoTheme
          .of(context)
          .textTheme
          .actionTextStyle
          .copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.red,
      ),
    );
  }

  if (!useText) {
    doneText = const Icon(CupertinoIcons.check_mark_circled);
  } else {
    doneText ??= Text(
      'Save',
      style: CupertinoTheme
          .of(context)
          .textTheme
          .actionTextStyle
          .copyWith(fontWeight: FontWeight.w600),
    );
  }

  var cancelButton = CupertinoButton(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: cancelText,
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  var doneButton = CupertinoButton(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: doneText,
    onPressed: () {
      if (selectedDateTime != null) {
        onDateTimeSelected(selectedDateTime);
      }
      Navigator.of(context).pop();
    },
  );

  showCupertinoModalPopup(
    context: context,
    builder: (context) =>
        SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.35,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(249, 249, 247, 1.0),
                  border: Border(
                    bottom: BorderSide(width: 0.5, color: Colors.black38),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    leftHanded ? doneButton : cancelButton,
                    leftHanded ? cancelButton : doneButton,
                  ],
                ),
              ),
              Expanded(
                  child: CupertinoDatePicker(
                    key: key,
                    mode: mode,
                    onDateTimeChanged: (DateTime value) {
                      if (mode == CupertinoDatePickerMode.time) {
                        selectedDateTime =
                            DateTime(0000, 01, 01, value.hour, value.minute);
                        onDateTimeChanged(selectedDateTime);
                      } else {
                        selectedDateTime = value;
                        onDateTimeChanged(selectedDateTime);
                      }
                    },
                    initialDateTime: initialDateTime,
                    minimumDate: minimumDate,
                    maximumDate: maximumDate,
                    minimumYear: minimumYear,
                    maximumYear: maximumYear,
                    minuteInterval: minuteInterval,
                    use24hFormat: use24hFormat,
                    backgroundColor: backgroundColor,
                    dateOrder: dateOrder,
                  )),
            ],
          ),
        ),
    filter: filter,
    useRootNavigator: useRootNavigator,
    semanticsDismissible: semanticsDismissible,
  );
}
