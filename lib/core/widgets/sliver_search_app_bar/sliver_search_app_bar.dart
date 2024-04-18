import 'package:chat_app/core/widgets/search/search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverSearchAppBar extends StatefulWidget {
  const SliverSearchAppBar({
    super.key,
    required this.title,
    required this.onChanged,
    required this.onSubmit,
    required this.text,
    required this.focusNode,
    this.leading,
    this.trailing,
  });

  final String title;
  final String text;
  final void Function(String value) onChanged;
  final void Function(String value) onSubmit;
  final Widget? leading;
  final Widget? trailing;
  final FocusNode focusNode;

  @override
  State<SliverSearchAppBar> createState() => _SliverSearchAppBarState();
}

class _SliverSearchAppBarState extends State<SliverSearchAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late final Animation<double> _paddingAnimation;
  late final Animation<double> _heightAnimation;

  bool get _searchMode => _paddingAnimation.value == 1;

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 480),
    );

    _paddingAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
        reverseCurve: Curves.easeIn,
      ),
    );

    _heightAnimation = Tween<double>(begin: 2.1, end: 1.1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInToLinear,
        reverseCurve: Curves.easeInToLinear,
      ),
    );

    /// Starts animation when focused or unfocused
    _controller.text = widget.text;
    widget.focusNode.addListener(_onFocus);
    _controller.addListener(_onType);
  }

  void _onFocus() {
    if (widget.focusNode.hasFocus) {
      _animationController.forward();
    } else if (_controller.text == '') {
      _animationController.reverse();
    }
  }

  void _onType() {
    if(!widget.focusNode.hasFocus && _controller.text == '') {
      _animationController.reverse();
    }
  }

  @override
  void didUpdateWidget(covariant SliverSearchAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.text != _controller.text) {
        _controller.text = widget.text;
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color borderColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? CupertinoColors.systemGrey
            : CupertinoColors.inactiveGray;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SliverAppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          pinned: true,
          centerTitle: true,
          stretch: true,
          clipBehavior: Clip.hardEdge,
          backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
          expandedHeight: kToolbarHeight * _heightAnimation.value,
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
            title: Transform.translate(
              offset: Offset(0, -200 * _paddingAnimation.value),
              child: Align(
                alignment: Alignment.topCenter,
                child: _AppBarTitle(
                  searchMode: _searchMode,
                  trailing: widget.trailing,
                  leading: widget.leading,
                  title: widget.title,
                ),
              ),
            ),
            background: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: ChatAppSearchField(
                  text: widget.text,
                  controller: _controller,
                  focusNode: widget.focusNode,
                  onChanged: widget.onChanged,
                  onSubmitted: widget.onSubmit,
                ),
              ),
            ),
          ),
        );
      },
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
