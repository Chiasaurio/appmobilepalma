import 'package:flutter/material.dart';

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double? min;
  final double? max;
  MySliverPersistentHeaderDelegate(this.widget, {this.min, this.max});

  final Widget widget;

  @override
  double get minExtent => min ?? 100;
  @override
  double get maxExtent => max ?? 100;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: widget,
    );
  }

  @override
  bool shouldRebuild(MySliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
