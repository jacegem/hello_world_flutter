

import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class EnsureVisibleWhenFocused extends StatefulWidget {
  const EnsureVisibleWhenFocused({
    Key key,
    @required this.child,
    @required this.focusNode,
    this.curve: Curves.ease,
    this.duration: const Duration(milliseconds:100),
  });

  /// The node we will monitor to determine if the child is focused;
  final FocusNode focusNode;

  /// The child widget that we are wrapping
  final Widget child;

  /// The curve we will sue to scroll ourselves into view.
  /// Defaults to Curves.ease.
  final Curve curve;

  /// The duration we will use to scroll ourselves into view
  /// Defaults to 100 milliseconds.
  final Duration duration;

  @override
  _EnsureVisibleWhenFocusedState createState() => _EnsureVisibleWhenFocusedState();
}

class _EnsureVisibleWhenFocusedState extends State<EnsureVisibleWhenFocused> {

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      widget.focusNode.addListener(_ensureVisible);
    }
  @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
      widget.focusNode.removeListener(_ensureVisible);
    }

  Future<Null> _ensureVisible() async{
    /// Wait for teh keyboard to come into view
    /// TODO: position doesn't seem to notify listeners when metrics change,
    /// perhaps a NotificiationListener around the scrollable could avoid
    /// the need insert a dealy here.
    await Future.delayed(const Duration(milliseconds: 300));

    if (!widget.focusNode.hasFocus)
      return;

    final RenderObject object = context.findRenderObject();
    final RenderAbstractViewport viewport = RenderAbstractViewport.of(object);
    assert(viewport != null);

    ScrollableState scrollableState = Scrollable.of(context);
    assert(scrollableState != null);

    ScrollPosition position = scrollableState.position;
    double alignment;

    if (position.pixels > viewport.getOffsetToReveal(object, 0.0).offset ){
      // Move down to the top of the viewport
      alignment = 0.0;
    } else if (position.pixels < viewport.getOffsetToReveal(object, 1.0).offset){
      alignment = 1.0;
    } else {
      // No scrolling is necessary to reveal the child
      return;
    }

    position.ensureVisible(object, alignment: alignment,duration: widget.duration, curve: widget.curve);



  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

/// final _titleFocusNode = FocuseNode()
///
/// EnsureVisibleWhenFocused(
///   focusNode: _titleFocusNode,
///   child: TextFormField(
///     focusNode: _titleFocuseNode,
///     ...
///   )
/// )
/// 


// https://github.com/letsar/flutter_slidable
