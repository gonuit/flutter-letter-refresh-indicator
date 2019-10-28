import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/widgets.dart';

import 'indicator.dart';

class LetterRefreshIndicator extends StatelessWidget {
  final Widget child;
  final bool leadingGlowVisible;
  final bool trailingGlowVisible;
  final RefreshCallback onRefresh;
  final Color accent;

  LetterRefreshIndicator({
    @required this.child,
    @required this.onRefresh,
    this.leadingGlowVisible = false,
    this.trailingGlowVisible = true,
    this.accent,
  }) : assert(onRefresh is RefreshCallback && onRefresh != null);

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      leadingGlowVisible: leadingGlowVisible,
      trailingGlowVisible: trailingGlowVisible,
      indicatorBuilder: (context, data) => LetterIndicator(
        data: data,
        accent: accent,
      ),
      onRefresh: onRefresh,
      child: child,
    );
  }
}
