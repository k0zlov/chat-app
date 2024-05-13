import 'package:chat_app/features/settings/view/widgets/settings_options_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsEditBirthDateSection extends StatefulWidget {
  const SettingsEditBirthDateSection({super.key});

  @override
  State<SettingsEditBirthDateSection> createState() =>
      _SettingsEditBirthDateSectionState();
}

class _SettingsEditBirthDateSectionState
    extends State<SettingsEditBirthDateSection> {
  bool _datePickerVisible = false;
  bool _showDatePicker = false;

  void _setShowDatePicker(bool newValue) {
    if (_showDatePicker == newValue) return;

    if (newValue) {
      _setVisibility(true);
    }

    Future.delayed(const Duration(milliseconds: 10), () {
      _showDatePicker = newValue;
      setState(() {});
    });
  }

  void _setVisibility(bool newValue) {
    if (_datePickerVisible == newValue) return;

    _datePickerVisible = newValue;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    final textStyle = theme.textTheme.textStyle.copyWith(
      fontSize: 12,
      color: CupertinoColors.systemGrey.withOpacity(0.6),
    );

    return CupertinoListSection.insetGrouped(
      dividerMargin: 0,
      additionalDividerMargin: 15,
      backgroundColor: Colors.transparent,
      footer: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Only your contacts can see your birthday.',
              style: textStyle,
            ),
            CupertinoButton(
              padding: const EdgeInsets.only(bottom: 26),
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    'Change',
                    style: textStyle.copyWith(
                      color: theme.primaryColor,
                      fontSize: 11,
                    ),
                  ),
                  const Icon(CupertinoIcons.right_chevron, size: 13),
                ],
              ),
            ),
          ],
        ),
      ),
      children: [
        SettingsOptionsItem(
          title: 'Date of Birth',
          onPressed: () => _setShowDatePicker(!_showDatePicker),
          trailingArrow: false,
          trailing: Text(
            '24 Jul 2006',
            style: textStyle.copyWith(
              fontSize: 14,
              color: _showDatePicker
                  ? theme.primaryColor
                  : CupertinoColors.systemGrey.withOpacity(0.6),
            ),
          ),
        ),
        if (_datePickerVisible) ...{
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutQuad,
            constraints: BoxConstraints(
              maxHeight: _showDatePicker ? 210 : 1,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            onEnd: () => _setVisibility(_showDatePicker),
            child: CupertinoDatePicker(
              initialDateTime: DateTime.now(),
              mode: CupertinoDatePickerMode.date,
              dateOrder: DatePickerDateOrder.dmy,
              onDateTimeChanged: (_) {},
            ),
          ),
          SettingsOptionsItem(
            title: 'Remove Date of Birth',
            trailingArrow: false,
            textColor: theme.primaryColor,
            onPressed: () {},
          ),
        },
      ],
    );
  }
}
