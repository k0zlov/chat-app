import 'package:chat_app/core/widgets/reactive_text_field.dart';
import 'package:chat_app/core/widgets/sliver_search_app_bar/search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverSearchAppBar extends StatefulWidget {
  const SliverSearchAppBar({
    super.key,
    required this.title,
    required this.onChanged,
    required this.onSubmit,
    required this.text,
    this.leading,
    this.trailing,
  });

  final String title;
  final String text;
  final void Function(String value) onChanged;
  final void Function(String value) onSubmit;
  final Widget? leading;
  final Widget? trailing;

  @override
  State<SliverSearchAppBar> createState() => _SliverSearchAppBarState();
}

class _SliverSearchAppBarState extends State<SliverSearchAppBar>
    with SingleTickerProviderStateMixin {
  final FocusNode focusNode = FocusNode();

  bool _searchMode = false;

  late AnimationController _animationController;
  late final Animation<double> _paddingAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 240),
      reverseDuration: const Duration(milliseconds: 440),
    );

    _paddingAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.decelerate,
        reverseCurve: Curves.ease,
      ),
    );

    /// Starts animation when focused or unfocused
    focusNode.addListener(_onFocus);
  }

  void _onFocus() {
    if (focusNode.hasFocus) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    if (focusNode.hasFocus != _searchMode) {
      _searchMode = focusNode.hasFocus;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color borderColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? CupertinoColors.systemGrey
            : CupertinoColors.inactiveGray;

    return SliverAppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      pinned: true,
      centerTitle: true,
      stretch: true,
      clipBehavior: Clip.hardEdge,
      backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
      expandedHeight:
          _searchMode ? kToolbarHeight + 15 : 2 * kToolbarHeight + 6,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.1),
        child: Container(
          height: 0.1,
          width: double.infinity,
          color: CupertinoTheme.of(context).barBackgroundColor,
          child: Divider(
            thickness: 0.1,
            color: borderColor,
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        titlePadding: const EdgeInsets.only(top: kToolbarHeight - 10),
        title: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -80 * _paddingAnimation.value),
              child: Align(
                alignment: Alignment.topCenter,
                child: _AppBarTitle(
                  searchMode: _searchMode,
                  trailing: widget.trailing,
                  leading: widget.leading,
                  title: widget.title,
                ),
              ),
            );
          },
        ),
        background: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: ReactiveTextField(
              text: widget.text,
              builder: (controller, _) {
                return ChatAppSearchField(
                  controller: controller,
                  focusNode: focusNode,
                  onChanged: widget.onChanged,
                  onSubmitted: widget.onSubmit,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({
    required this.searchMode,
    required this.leading,
    required this.trailing,
    required this.title,
  });

  final String title;
  final bool searchMode;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = CupertinoTheme.of(context).textTheme.textStyle;

    return SizedBox(
      height: 80,
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              title,
              style: textStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: 15,
            top: 0,
            child: _CustomAppBarActionItem(
              hide: searchMode,
              child: leading ?? const SizedBox(),
            ),
          ),
          Positioned(
            right: 15,
            top: 0,
            child: _CustomAppBarActionItem(
              hide: searchMode,
              child: trailing ?? const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBarActionItem extends StatelessWidget {
  const _CustomAppBarActionItem({
    required this.hide,
    required this.child,
  });

  final bool hide;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: hide ? 0 : 1,
      duration: const Duration(milliseconds: 300),
      child: child,
    );
  }
}
