import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GenWrap extends MultiChildRenderObjectWidget {
  GenWrap({
    super.key,
    required Widget first,
    required Widget second,
  }) : super(
         children: [first, second],
       );

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderBox();
  }
}

class _ParentData extends ContainerBoxParentData<RenderBox> {}

class _RenderBox extends RenderBox
    with ContainerRenderObjectMixin<RenderBox, _ParentData>, RenderBoxContainerDefaultsMixin<RenderBox, _ParentData> {
  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! _ParentData) {
      child.parentData = _ParentData();
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }

  @override
  void performLayout() {
    final RenderBox? first = firstChild;
    if (first == null) {
      throw 'no first child';
    }

    final RenderBox? second = childAfter(first);
    if (second == null) {
      throw 'no second child';
    }

    first.layout(constraints.loosen(), parentUsesSize: true);
    second.layout(constraints.loosen(), parentUsesSize: true);

    final double biggerHeight = max(first.size.height, second.size.height);

    if (first.size.width + second.size.width < constraints.maxWidth) {
      (first.parentData as _ParentData).offset = Offset(
        0,
        (biggerHeight - first.size.height) / 2,
      );
      (second.parentData as _ParentData).offset = Offset(
        constraints.maxWidth - second.size.width,
        (biggerHeight - second.size.height) / 2,
      );
      size = Size(constraints.maxWidth, biggerHeight);
    } else {
      (first.parentData as _ParentData).offset = Offset.zero;
      (second.parentData as _ParentData).offset = Offset(
        constraints.maxWidth - second.size.width,
        first.size.height,
      );
      size = Size(constraints.maxWidth, first.size.height + second.size.height);
    }
  }
}
