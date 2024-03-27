import 'package:flutter/cupertino.dart';

class AuthInfoPageData {
  const AuthInfoPageData({
    required this.header,
    required this.description,
    required this.label,
  });

  final Widget header;
  final List<String> description;
  final String label;

  static final data = <AuthInfoPageData>[
    AuthInfoPageData(
      header: Image.asset(
        'assets/images/logo.png',
        height: 150,
      ),
      description: [
        '',
        "The clone of world's",
        'fastest',
        'messaging app. It is',
        'free',
        'and',
        'secure.',
      ],
      label: 'Telegram clone',
    ),
    AuthInfoPageData(
      header: Image.asset(
        'assets/images/speedometer.png',
        height: 150,
      ),
      description: [
        'This application',
        'delivers messages faster than any other application.',
      ],
      label: 'Fast',
    ),
    AuthInfoPageData(
      header: Image.asset(
        'assets/images/gift.png',
        height: 150,
      ),
      description: [
        'We provide free',
        '',
        'unlimited',
        'cloud storage for chats and media.',
      ],
      label: 'Free',
    ),
    AuthInfoPageData(
      header: Image.asset(
        'assets/images/lock.png',
        height: 150,
      ),
      description: [
        'The clone of telegram',
        'keeps your messages safe from hacker attacks.',
      ],
      label: 'Secure',
    ),
    AuthInfoPageData(
      header: Image.asset(
        'assets/images/cloud.png',
        height: 150,
      ),
      description: [
        '',
        'You can access your messages from',
        'multiple devices.',
      ],
      label: 'Cloud-Based',
    ),
  ];
}

class AuthInfoPage extends StatelessWidget {
  const AuthInfoPage({
    super.key,
    required this.pageData,
    this.headerPadding = 30,
  });

  final AuthInfoPageData pageData;
  final double headerPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: pageData.header,
        ),
        SizedBox(height: headerPadding),
        Column(
          children: [
            Text(
              pageData.label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .textStyle
                      .copyWith(fontSize: 22),
                  children: [
                    for (int i = 0; i < pageData.description.length; i++) ...{
                      TextSpan(
                        text: '${pageData.description[i]} ',
                        style: TextStyle(
                          fontWeight: i.isEven ? FontWeight.bold : null,
                        ),
                      ),
                    },
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
