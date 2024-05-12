import 'package:chat_app/core/widgets/buttons/text_input_clear_button.dart';
import 'package:chat_app/core/widgets/reactive_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({
    super.key,
    required this.title,
    required this.inputName,
    required this.text,
    required this.isValid,
    required this.onChanged,
    required this.onSubmit,
    required this.focusNode,
  });

  final String title;
  final String inputName;
  final String text;
  final bool isValid;
  final FocusNode focusNode;
  final void Function(String text) onChanged;
  final void Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 140),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: CupertinoTheme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        children: [
          _AddScreenHeader(
            isValid: isValid,
            title: title,
            onChanged: onChanged,
            onSubmit: onSubmit,
          ),
          Expanded(
            child: _AddScreenBody(
              focusNode: focusNode,
              text: text,
              inputName: inputName,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class _AddScreenBody extends StatefulWidget {
  const _AddScreenBody({
    required this.text,
    required this.inputName,
    required this.onChanged,
    required this.focusNode,
  });

  final String text;
  final String inputName;

  final FocusNode focusNode;

  final void Function(String text) onChanged;

  @override
  State<_AddScreenBody> createState() => _AddScreenBodyState();
}

class _AddScreenBodyState extends State<_AddScreenBody> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.focusNode.focusInDirection(TraversalDirection.up);
    });
  }

  @override
  void dispose() {
    widget.focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color borderColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? CupertinoColors.systemGrey
            : CupertinoColors.inactiveGray;

    final BorderSide borderSide = BorderSide(color: borderColor, width: 0.3);

    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        );

    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          child: ReactiveTextField(
            text: widget.text,
            builder: (controller, _) {
              return CupertinoTextField(
                controller: controller,
                focusNode: widget.focusNode,
                onChanged: widget.onChanged,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: borderSide,
                  ),
                ),
                style: textStyle.copyWith(fontSize: 16),
                padding: const EdgeInsets.all(15),
                suffixMode: OverlayVisibilityMode.editing,
                suffix: TextInputClearButton(
                  padding: const EdgeInsets.only(right: 9),
                  onPressed: () => widget.onChanged(''),
                ),
                prefix: Container(
                  decoration: BoxDecoration(
                    border: Border(right: borderSide),
                  ),
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  child: Text(
                    widget.inputName,
                    style: textStyle.copyWith(
                      color: CupertinoTheme.of(context).primaryColor,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _AddScreenHeader extends StatelessWidget {
  const _AddScreenHeader({
    required this.isValid,
    required this.onChanged,
    required this.onSubmit,
    required this.title,
  });

  final String title;

  final bool isValid;
  final void Function(String text) onChanged;
  final void Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CupertinoButton(
          onPressed: context.pop,
          child: Text(
            'Cancel',
            style: textStyle.copyWith(
              color: CupertinoTheme.of(context).primaryColor,
            ),
          ),
        ),
        Text(
          title,
          style: textStyle.copyWith(fontWeight: FontWeight.w600),
        ),
        CupertinoButton(
          onPressed: !isValid
              ? null
              : () {
                  context.pop();
                  onSubmit();
                  onChanged('');
                },
          child: Text(
            'Create',
            style: textStyle.copyWith(
              color: isValid
                  ? CupertinoTheme.of(context).primaryColor
                  : CupertinoColors.systemGrey3,
            ),
          ),
        ),
      ],
    );
  }
}
