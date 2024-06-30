import 'package:flutter/cupertino.dart';

class ModalPopUpContainer extends StatelessWidget {
  const ModalPopUpContainer({
    this.iconData,
    super.key,
    this.title,
    this.message,
  });

  final String? title;
  final String? message;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: CupertinoTheme.of(context).barBackgroundColor,
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                iconData,
                size: 30,
                color: CupertinoColors.inactiveGray,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null) ...{
                      Text(
                        title!,
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    },
                    const SizedBox(height: 5),
                    if (message != null) ...{
                      Text(
                        message ?? '',
                        style: const TextStyle(fontSize: 16),
                      ),
                    },
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}
