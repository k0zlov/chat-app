import 'dart:async';

import 'package:chat_app/features/auth/view/widgets/info_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InitialInfoPageView extends StatefulWidget {
  const InitialInfoPageView({super.key});

  @override
  State<InitialInfoPageView> createState() => _InitialInfoPageViewState();
}

class _InitialInfoPageViewState extends State<InitialInfoPageView> {
  final PageController _pageController = PageController();

  bool _wasTouched = true;

  Timer? _timer;
  int _currentPage = 0;

  final List<AuthInfoPageData> infoPageDataList = AuthInfoPageData.data;

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_wasTouched) return;

      _currentPage = _pageController.page?.toInt() ?? 0;

      if (_currentPage < infoPageDataList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = CupertinoTheme.of(context).primaryColor;

    return Column(
      children: [
        SizedBox(
          height: 340,
          child: PageView(
            controller: _pageController,
            children: [
              for (final pageData in infoPageDataList) ...{
                AuthInfoPage(pageData: pageData),
              },
            ],
          ),
        ),
        const SizedBox(height: 35),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 15),
            SmoothPageIndicator(
              count: infoPageDataList.length,
              controller: _pageController,
              onDotClicked: (index) {
                if (!_wasTouched) _wasTouched = true;
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                );
              },
              effect: ColorTransitionEffect(
                dotHeight: 9,
                dotWidth: 9,
                spacing: 10,
                activeDotColor: primaryColor,
              ),
            ),
            const SizedBox(width: 5),
            CupertinoButton(
              onPressed: () {
                _wasTouched = !_wasTouched;
                setState(() {});
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 100),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: Icon(
                  _wasTouched ? CupertinoIcons.play : CupertinoIcons.pause,
                  key: ValueKey<bool>(_wasTouched),
                  color: _wasTouched
                      ? primaryColor
                      : CupertinoColors.inactiveGray,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
