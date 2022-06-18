import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:nav_router/nav_router.dart';

enum _AlertDialogSections {
  contentSection,
  actionsSection,
}

class _DialogSizes {
  const _DialogSizes({required this.size, required this.actionSectionYOffset});

  final Size size;
  final double actionSectionYOffset;
}

Future<T?> cupertionDialog<T>({
  // required BuildContext context,
  required WidgetBuilder builder,
  String? barrierLabel,
  bool useRootNavigator = true,
  bool barrierDismissible = false,
  RouteSettings? routeSettings,
}) {
  // assert(builder != null);
  // assert(useRootNavigator != null);

  return Navigator.of(navGK.currentState!.context,
      rootNavigator: useRootNavigator)
      .push<T>(CupertinoDialogRoute<T>(
    builder: builder,
    context: navGK.currentState!.context,
    barrierDismissible: barrierDismissible,
    barrierLabel: barrierLabel,
    barrierColor: CupertinoDynamicColor.resolve(
        _kModalBarrierColor, navGK.currentState!.context),
    settings: routeSettings,
  ));
}

const TextStyle _kCupertinoDialogTitleStyle = TextStyle(
  fontFamily: '.SF UI Display',
  inherit: false,
  fontSize: 18.0,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.48,
  textBaseline: TextBaseline.alphabetic,
);

const TextStyle _kCupertinoDialogContentStyle = TextStyle(
  fontFamily: '.SF UI Text',
  inherit: false,
  fontSize: 13.4,
  fontWeight: FontWeight.w400,
  height: 1.036,
  letterSpacing: -0.25,
  textBaseline: TextBaseline.alphabetic,
);

const Color _kModalBarrierColor = CupertinoDynamicColor.withBrightness(
  color: Color(0x33000000),
  darkColor: Color(0x7A000000),
);

// const TextStyle _kCupertinoDialogActionStyle = TextStyle(
//   fontFamily:'.SF UI Text',
//   inherit: false,
//   fontSize: 16.8,
//   fontWeight: FontWeight.w400,
//   textBaseline: TextBaseline.alphabetic,
// );

// iOS dialogs have a normal display width and another display width that is
// used when the device is in accessibility mode. Each of these widths are
// listed below.
const double _kCupertinoDialogWidth = 270.0;
const double _kAccessibilityCupertinoDialogWidth = 310.0;

// const double _kBlurAmount = 20.0;
const double _kEdgePadding = 20.0;
// const double _kMinButtonHeight = 45.0;
// const double _kMinButtonFontSize = 10.0;
// const double _kDialogCornerRadius = 14.0;
const double _kDividerThickness = 1.0;

// A translucent color that is painted on top of the blurred backdrop as the
// dialog's background color
// Extracted from https://developer.apple.com/design/resources/.
// const Color _kDialogColor = CupertinoDynamicColor.withBrightness(
//   color: Color(0xCCF2F2F2),
//   darkColor: Color(0xBF1E1E1E),
// );

const Color _kDialogColor = CupertinoDynamicColor.withBrightness(
  color: Color(0xFFFFFFFF),
  darkColor: Color(0xFF000000),
);

// Translucent light gray that is painted on top of the blurred backdrop as the
// background color of a pressed button.
// Eyeballed from iOS 13 beta simulator.
const Color _kDialogPressedColor = CupertinoDynamicColor.withBrightness(
  color: Color(0xFFE1E1E1),
  darkColor: Color(0xFF2E2E2E),
);

const double _kMaxRegularTextScaleFactor = 1.4;

// Accessibility mode on iOS is determined by the text scale factor that the
// user has selected.
bool _isInAccessibilityMode(BuildContext context) {
  final MediaQueryData? data = MediaQuery.of(
    context,
  );
  return data != null && data.textScaleFactor > _kMaxRegularTextScaleFactor;
}

class BenpayCupertinoDialog extends StatelessWidget {
  /// Creates an iOS-style alert dialog.
  ///
  /// The [actions] must not be null.
  const BenpayCupertinoDialog({
    Key? key,
    this.title,
    this.content,
    this.actions = const <Widget>[],
    this.scrollController,
    this.actionScrollController,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
  }) :
  // assert(actions != null),
        super(key: key);

  /// The (optional) title of the dialog is displayed in a large font at the top
  /// of the dialog.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// The (optional) content of the dialog is displayed in the center of the
  /// dialog in a lighter font.
  ///
  /// Typically a [Text] widget.
  final Widget? content;

  /// The (optional) set of actions that are displayed at the bottom of the
  /// dialog.
  ///
  /// Typically this is a list of [CupertinoDialogAction] widgets.
  final List<Widget> actions;

  /// A scroll controller that can be used to control the scrolling of the
  /// [content] in the dialog.
  ///
  /// Defaults to null, and is typically not needed, since most alert messages
  /// are short.
  ///
  /// See also:
  ///
  ///  * [actionScrollController], which can be used for controlling the actions
  ///    section when there are many actions.
  final ScrollController? scrollController;

  /// A scroll controller that can be used to control the scrolling of the
  /// actions in the dialog.
  ///
  /// Defaults to null, and is typically not needed.
  ///
  /// See also:
  ///
  ///  * [scrollController], which can be used for controlling the [content]
  ///    section when it is long.
  final ScrollController? actionScrollController;

  /// {@macro flutter.material.dialog.insetAnimationDuration}
  final Duration insetAnimationDuration;

  /// {@macro flutter.material.dialog.insetAnimationCurve}
  final Curve insetAnimationCurve;

  Widget _buildContent(BuildContext context) {
    final List<Widget> children = <Widget>[
      if (title != null || content != null)
        Flexible(
          flex: 3,
          child: _CupertinoAlertContentSection(
            title: title,
            content: content,
            scrollController: scrollController,
          ),
        ),
    ];

    return Container(
      color: CupertinoDynamicColor.resolve(_kDialogColor, context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }

  Widget _buildActions() {
    Widget actionSection = Container(
      height: 0.0,
    );
    if (actions.isNotEmpty) {
      actionSection = _CupertinoAlertActionSection(
        children: actions,
        scrollController: actionScrollController,
      );
    }

    return actionSection;
  }

  @override
  Widget build(BuildContext context) {
    final CupertinoLocalizations localizations =
    CupertinoLocalizations.of(context);
    final bool isInAccessibilityMode = _isInAccessibilityMode(context);
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return CupertinoUserInterfaceLevel(
      data: CupertinoUserInterfaceLevelData.elevated,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: math.max(textScaleFactor, 1.0),
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return AnimatedPadding(
              padding: MediaQuery.of(context).viewInsets +const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
              duration: insetAnimationDuration,
              curve: insetAnimationCurve,
              child: MediaQuery.removeViewInsets(
                removeLeft: true,
                removeTop: true,
                removeRight: true,
                removeBottom: true,
                context: context,
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: _kEdgePadding),
                    width: isInAccessibilityMode
                        ? _kAccessibilityCupertinoDialogWidth
                        : _kCupertinoDialogWidth,
                    child: CupertinoPopupSurface(
                      isSurfacePainted: false,
                      child: Semantics(
                        namesRoute: true,
                        scopesRoute: true,
                        explicitChildNodes: true,
                        label: localizations.alertDialogLabel,
                        child: _CupertinoDialogRenderWidget(
                          contentSection: _buildContent(context),
                          actionsSection: _buildActions(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CupertinoAlertContentSection extends StatelessWidget {
  const _CupertinoAlertContentSection({
    Key? key,
    this.title,
    this.content,
    this.scrollController,
  }) : super(key: key);

  // The (optional) title of the dialog is displayed in a large font at the top
  // of the dialog.
  //
  // Typically a Text widget.
  final Widget? title;

  // The (optional) content of the dialog is displayed in the center of the
  // dialog in a lighter font.
  //
  // Typically a Text widget.
  final Widget? content;

  // A scroll controller that can be used to control the scrolling of the
  // content in the dialog.
  //
  // Defaults to null, and is typically not needed, since most alert contents
  // are short.
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    if (title == null && content == null) {
      return SingleChildScrollView(
        controller: scrollController,
        child: const SizedBox(width: 0.0, height: 0.0),
      );
    }

    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final List<Widget> titleContentGroup = <Widget>[
      if (title != null)
        Padding(
          padding: EdgeInsets.only(
            left: _kEdgePadding,
            right: _kEdgePadding,
            bottom: content == null ? _kEdgePadding : 1.0,
            top: _kEdgePadding * textScaleFactor,
          ),
          child: DefaultTextStyle(
            style: _kCupertinoDialogTitleStyle.copyWith(
              color:
              CupertinoDynamicColor.resolve(CupertinoColors.label, context),
            ),
            textAlign: TextAlign.center,
            child: title!,
          ),
        ),
      if (content != null)
        Padding(
          padding: EdgeInsets.only(
            left: _kEdgePadding,
            right: _kEdgePadding,
            bottom: _kEdgePadding * textScaleFactor,
            top: title == null ? _kEdgePadding : 1.0,
          ),
          child: DefaultTextStyle(
            style: _kCupertinoDialogContentStyle.copyWith(
              color:
              CupertinoDynamicColor.resolve(CupertinoColors.label, context),
            ),
            textAlign: TextAlign.center,
            child: content!,
          ),
        ),
    ];

    return CupertinoScrollbar(
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: titleContentGroup,
        ),
      ),
    );
  }
}

class _CupertinoAlertActionSection extends StatefulWidget {
  const _CupertinoAlertActionSection({
    Key? key,
    required this.children,
    this.scrollController,
  }) :
  // assert(children != null),
        super(key: key);

  final List<Widget> children;

  // A scroll controller that can be used to control the scrolling of the
  // actions in the dialog.
  //
  // Defaults to null, and is typically not needed, since most alert dialogs
  // don't have many actions.
  final ScrollController? scrollController;

  @override
  _CupertinoAlertActionSectionState createState() =>
      _CupertinoAlertActionSectionState();
}

class _CupertinoAlertActionSectionState
    extends State<_CupertinoAlertActionSection> {
  @override
  Widget build(BuildContext context) {
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    final List<Widget> interactiveButtons = <Widget>[];
    for (int i = 0; i < widget.children.length; i += 1) {
      interactiveButtons.add(
        _PressableActionButton(
          child: widget.children[i],
        ),
      );
    }

    return CupertinoScrollbar(
      child: SingleChildScrollView(
        controller: widget.scrollController,
        child: _CupertinoDialogActionsRenderWidget(
          actionButtons: interactiveButtons,
          dividerThickness: _kDividerThickness / devicePixelRatio,
        ),
      ),
    );
  }
}

class _CupertinoDialogRenderWidget extends RenderObjectWidget {
  const _CupertinoDialogRenderWidget({
    Key? key,
    required this.contentSection,
    required this.actionsSection,
  }) : super(key: key);

  final Widget contentSection;
  final Widget actionsSection;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderCupertinoDialog(
      dividerThickness:
      _kDividerThickness / MediaQuery.of(context).devicePixelRatio,
      isInAccessibilityMode: _isInAccessibilityMode(context),
      dividerColor:
      CupertinoDynamicColor.resolve(CupertinoColors.separator, context),
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderCupertinoDialog renderObject) {
    renderObject
      ..isInAccessibilityMode = _isInAccessibilityMode(context)
      ..dividerColor =
      CupertinoDynamicColor.resolve(CupertinoColors.separator, context);
  }

  @override
  RenderObjectElement createElement() {
    return _CupertinoDialogRenderElement(this);
  }
}

class _PressableActionButton extends StatefulWidget {
  const _PressableActionButton({
    required this.child,
  });

  final Widget child;

  @override
  _PressableActionButtonState createState() => _PressableActionButtonState();
}

class _PressableActionButtonState extends State<_PressableActionButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return _ActionButtonParentDataWidget(
      isPressed: _isPressed,
      child: MergeSemantics(
        child: GestureDetector(
          excludeFromSemantics: true,
          behavior: HitTestBehavior.opaque,
          onTapDown: (TapDownDetails details) => setState(() {
            _isPressed = true;
          }),
          onTapUp: (TapUpDetails details) => setState(() {
            _isPressed = false;
          }),
          onTapCancel: () => setState(() => _isPressed = false),
          child: widget.child,
        ),
      ),
    );
  }
}

class _CupertinoDialogActionsRenderWidget extends MultiChildRenderObjectWidget {
  _CupertinoDialogActionsRenderWidget({
    Key? key,
    required List<Widget> actionButtons,
    double dividerThickness = 0.0,
  })  : _dividerThickness = dividerThickness,
        super(key: key, children: actionButtons);

  final double _dividerThickness;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderCupertinoDialogActions(
      dialogWidth: _isInAccessibilityMode(context)
          ? _kAccessibilityCupertinoDialogWidth
          : _kCupertinoDialogWidth,
      dividerThickness: _dividerThickness,
      dialogColor: CupertinoDynamicColor.resolve(_kDialogColor, context),
      dialogPressedColor:
      CupertinoDynamicColor.resolve(_kDialogPressedColor, context),
      dividerColor:
      CupertinoDynamicColor.resolve(CupertinoColors.separator, context),
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderCupertinoDialogActions renderObject) {
    renderObject
      ..dialogWidth = _isInAccessibilityMode(context)
          ? _kAccessibilityCupertinoDialogWidth
          : _kCupertinoDialogWidth
      ..dividerThickness = _dividerThickness
      ..dialogColor = CupertinoDynamicColor.resolve(_kDialogColor, context)
      ..dialogPressedColor =
      CupertinoDynamicColor.resolve(_kDialogPressedColor, context)
      ..dividerColor =
      CupertinoDynamicColor.resolve(CupertinoColors.separator, context);
  }
}

class _RenderCupertinoDialog extends RenderBox {
  _RenderCupertinoDialog({
    RenderBox? contentSection,
    RenderBox? actionsSection,
    double dividerThickness = 0.0,
    bool isInAccessibilityMode = false,
    required Color dividerColor,
  })  : _contentSection = contentSection,
        _actionsSection = actionsSection,
        _dividerThickness = dividerThickness,
        _isInAccessibilityMode = isInAccessibilityMode,
        _dividerPaint = Paint()
          ..color = dividerColor
          ..style = PaintingStyle.fill;

  RenderBox? get contentSection => _contentSection;
  RenderBox? _contentSection;
  set contentSection(RenderBox? newContentSection) {
    if (newContentSection != _contentSection) {
      if (_contentSection != null) {
        dropChild(_contentSection!);
      }
      _contentSection = newContentSection;
      if (_contentSection != null) {
        adoptChild(_contentSection!);
      }
    }
  }

  RenderBox? get actionsSection => _actionsSection;
  RenderBox? _actionsSection;
  set actionsSection(RenderBox? newActionsSection) {
    if (newActionsSection != _actionsSection) {
      if (null != _actionsSection) {
        dropChild(_actionsSection!);
      }
      _actionsSection = newActionsSection;
      if (null != _actionsSection) {
        adoptChild(_actionsSection!);
      }
    }
  }

  bool get isInAccessibilityMode => _isInAccessibilityMode;
  bool _isInAccessibilityMode;
  set isInAccessibilityMode(bool newValue) {
    if (newValue != _isInAccessibilityMode) {
      _isInAccessibilityMode = newValue;
      markNeedsLayout();
    }
  }

  double get _dialogWidth => isInAccessibilityMode
      ? _kAccessibilityCupertinoDialogWidth
      : _kCupertinoDialogWidth;

  final double _dividerThickness;
  final Paint _dividerPaint;

  Color get dividerColor => _dividerPaint.color;
  set dividerColor(Color newValue) {
    if (dividerColor == newValue) {
      return;
    }

    _dividerPaint.color = newValue;
    markNeedsPaint();
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    if (null != contentSection) {
      contentSection!.attach(owner);
    }
    if (null != actionsSection) {
      actionsSection!.attach(owner);
    }
  }

  @override
  void detach() {
    super.detach();
    if (null != contentSection) {
      contentSection!.detach();
    }
    if (null != actionsSection) {
      actionsSection!.detach();
    }
  }

  @override
  void redepthChildren() {
    if (null != contentSection) {
      redepthChild(contentSection!);
    }
    if (null != actionsSection) {
      redepthChild(actionsSection!);
    }
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! BoxParentData) {
      child.parentData = BoxParentData();
    }
  }

  @override
  void visitChildren(RenderObjectVisitor visitor) {
    if (contentSection != null) {
      visitor(contentSection!);
    }
    if (actionsSection != null) {
      visitor(actionsSection!);
    }
  }

  @override
  List<DiagnosticsNode> debugDescribeChildren() => <DiagnosticsNode>[
    if (contentSection != null)
      contentSection!.toDiagnosticsNode(name: 'content'),
    if (actionsSection != null)
      actionsSection!.toDiagnosticsNode(name: 'actions'),
  ];

  @override
  double computeMinIntrinsicWidth(double height) {
    return _dialogWidth;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    return _dialogWidth;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    final double contentHeight = contentSection!.getMinIntrinsicHeight(width);
    final double actionsHeight = actionsSection!.getMinIntrinsicHeight(width);
    final bool hasDivider = contentHeight > 0.0 && actionsHeight > 0.0;
    final double height =
        contentHeight + (hasDivider ? _dividerThickness : 0.0) + actionsHeight;

    if (height.isFinite) return height;
    return 0.0;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    final double contentHeight = contentSection!.getMaxIntrinsicHeight(width);
    final double actionsHeight = actionsSection!.getMaxIntrinsicHeight(width);
    final bool hasDivider = contentHeight > 0.0 && actionsHeight > 0.0;
    final double height =
        contentHeight + (hasDivider ? _dividerThickness : 0.0) + actionsHeight;

    if (height.isFinite) return height;
    return 0.0;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return _performLayout(
      constraints: constraints,
      layoutChild: ChildLayoutHelper.dryLayoutChild,
    ).size;
  }

  @override
  void performLayout() {
    final _DialogSizes dialogSizes = _performLayout(
      constraints: constraints,
      layoutChild: ChildLayoutHelper.layoutChild,
    );
    size = dialogSizes.size;

    // Set the position of the actions box to sit at the bottom of the dialog.
    // The content box defaults to the top left, which is where we want it.
    assert(actionsSection!.parentData is BoxParentData);
    final BoxParentData actionParentData =
    actionsSection!.parentData! as BoxParentData;
    actionParentData.offset = Offset(0.0, dialogSizes.actionSectionYOffset);
  }

  _DialogSizes _performLayout(
      {required BoxConstraints constraints,
        required ChildLayouter layoutChild}) {
    return isInAccessibilityMode
        ? performAccessibilityLayout(
      constraints: constraints,
      layoutChild: layoutChild,
    )
        : performRegularLayout(
      constraints: constraints,
      layoutChild: layoutChild,
    );
  }

  // When not in accessibility mode, an alert dialog might reduce the space
  // for buttons to just over 1 button's height to make room for the content
  // section.
  _DialogSizes performRegularLayout(
      {required BoxConstraints constraints,
        required ChildLayouter layoutChild}) {
    final bool hasDivider =
        contentSection!.getMaxIntrinsicHeight(_dialogWidth) > 0.0 &&
            actionsSection!.getMaxIntrinsicHeight(_dialogWidth) > 0.0;
    final double dividerThickness = hasDivider ? _dividerThickness : 0.0;

    final double minActionsHeight =
    actionsSection!.getMinIntrinsicHeight(_dialogWidth);

    final Size contentSize = layoutChild(
      contentSection!,
      constraints.deflate(
          EdgeInsets.only(bottom: minActionsHeight + dividerThickness)),
    );

    final Size actionsSize = layoutChild(
      actionsSection!,
      constraints
          .deflate(EdgeInsets.only(top: contentSize.height + dividerThickness)),
    );

    final double dialogHeight =
        contentSize.height + dividerThickness + actionsSize.height;

    return _DialogSizes(
      size: constraints.constrain(Size(_dialogWidth, dialogHeight)),
      actionSectionYOffset: contentSize.height + dividerThickness,
    );
  }

  // When in accessibility mode, an alert dialog will allow buttons to take
  // up to 50% of the dialog height, even if the content exceeds available space.
  _DialogSizes performAccessibilityLayout(
      {required BoxConstraints constraints,
        required ChildLayouter layoutChild}) {
    final bool hasDivider =
        contentSection!.getMaxIntrinsicHeight(_dialogWidth) > 0.0 &&
            actionsSection!.getMaxIntrinsicHeight(_dialogWidth) > 0.0;
    final double dividerThickness = hasDivider ? _dividerThickness : 0.0;

    final double maxContentHeight =
    contentSection!.getMaxIntrinsicHeight(_dialogWidth);
    final double maxActionsHeight =
    actionsSection!.getMaxIntrinsicHeight(_dialogWidth);

    final Size contentSize;
    final Size actionsSize;
    if (maxContentHeight + dividerThickness + maxActionsHeight >
        constraints.maxHeight) {
      // There isn't enough room for everything. Following iOS's accessibility dialog
      // layout policy, first we allow the actions to take up to 50% of the dialog
      // height. Second we fill the rest of the available space with the content
      // section.

      actionsSize = layoutChild(
        actionsSection!,
        constraints.deflate(EdgeInsets.only(top: constraints.maxHeight / 2.0)),
      );

      contentSize = layoutChild(
        contentSection!,
        constraints.deflate(
            EdgeInsets.only(bottom: actionsSize.height + dividerThickness)),
      );
    } else {
      // Everything fits. Give content and actions all the space they want.

      contentSize = layoutChild(
        contentSection!,
        constraints,
      );

      actionsSize = layoutChild(
        actionsSection!,
        constraints.deflate(EdgeInsets.only(top: contentSize.height)),
      );
    }

    // Calculate overall dialog height.
    final double dialogHeight =
        contentSize.height + dividerThickness + actionsSize.height;

    return _DialogSizes(
      size: constraints.constrain(Size(_dialogWidth, dialogHeight)),
      actionSectionYOffset: contentSize.height + dividerThickness,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final BoxParentData contentParentData =
    contentSection!.parentData! as BoxParentData;
    contentSection!.paint(context, offset + contentParentData.offset);

    final bool hasDivider =
        contentSection!.size.height > 0.0 && actionsSection!.size.height > 0.0;
    if (hasDivider) {
      _paintDividerBetweenContentAndActions(context.canvas, offset);
    }

    final BoxParentData actionsParentData =
    actionsSection!.parentData! as BoxParentData;
    actionsSection!.paint(context, offset + actionsParentData.offset);
  }

  void _paintDividerBetweenContentAndActions(Canvas canvas, Offset offset) {
    canvas.drawRect(
      Rect.fromLTWH(
        offset.dx,
        offset.dy + contentSection!.size.height,
        size.width,
        _dividerThickness,
      ),
      _dividerPaint,
    );
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    final BoxParentData contentSectionParentData =
    contentSection!.parentData! as BoxParentData;
    final BoxParentData actionsSectionParentData =
    actionsSection!.parentData! as BoxParentData;
    return result.addWithPaintOffset(
      offset: contentSectionParentData.offset,
      position: position,
      hitTest: (BoxHitTestResult result, Offset transformed) {
        assert(transformed == position - contentSectionParentData.offset);
        return contentSection!.hitTest(result, position: transformed);
      },
    ) ||
        result.addWithPaintOffset(
          offset: actionsSectionParentData.offset,
          position: position,
          hitTest: (BoxHitTestResult result, Offset transformed) {
            assert(transformed == position - actionsSectionParentData.offset);
            return actionsSection!.hitTest(result, position: transformed);
          },
        );
  }
}

class _CupertinoDialogRenderElement extends RenderObjectElement {
  _CupertinoDialogRenderElement(_CupertinoDialogRenderWidget widget)
      : super(widget);

  Element? _contentElement;
  Element? _actionsElement;

  @override
  _CupertinoDialogRenderWidget get widget =>
      super.widget as _CupertinoDialogRenderWidget;

  @override
  _RenderCupertinoDialog get renderObject =>
      super.renderObject as _RenderCupertinoDialog;

  @override
  void visitChildren(ElementVisitor visitor) {
    if (_contentElement != null) {
      visitor(_contentElement!);
    }
    if (_actionsElement != null) {
      visitor(_actionsElement!);
    }
  }

  @override
  void mount(Element? parent, dynamic newSlot) {
    super.mount(parent, newSlot);
    _contentElement = updateChild(_contentElement, widget.contentSection,
        _AlertDialogSections.contentSection);
    _actionsElement = updateChild(_actionsElement, widget.actionsSection,
        _AlertDialogSections.actionsSection);
  }

  @override
  void insertRenderObjectChild(RenderObject child, _AlertDialogSections slot) {
    // assert(slot != null);
    switch (slot) {
      case _AlertDialogSections.contentSection:
        renderObject.contentSection = child as RenderBox;
        break;
      case _AlertDialogSections.actionsSection:
        renderObject.actionsSection = child as RenderBox;
        break;
    }
  }

  @override
  void moveRenderObjectChild(RenderObject child, _AlertDialogSections oldSlot,
      _AlertDialogSections newSlot) {
    assert(false);
  }

  @override
  void update(RenderObjectWidget newWidget) {
    super.update(newWidget);
    _contentElement = updateChild(_contentElement, widget.contentSection,
        _AlertDialogSections.contentSection);
    _actionsElement = updateChild(_actionsElement, widget.actionsSection,
        _AlertDialogSections.actionsSection);
  }

  @override
  void forgetChild(Element child) {
    assert(child == _contentElement || child == _actionsElement);
    if (_contentElement == child) {
      _contentElement = null;
    } else {
      assert(_actionsElement == child);
      _actionsElement = null;
    }
    super.forgetChild(child);
  }

  @override
  void removeRenderObjectChild(RenderObject child, _AlertDialogSections slot) {
    assert(child == renderObject.contentSection ||
        child == renderObject.actionsSection);
    if (renderObject.contentSection == child) {
      renderObject.contentSection = null;
    } else {
      assert(renderObject.actionsSection == child);
      renderObject.actionsSection = null;
    }
  }
}

class _ActionButtonParentDataWidget
    extends ParentDataWidget<_ActionButtonParentData> {
  const _ActionButtonParentDataWidget({
    Key? key,
    required this.isPressed,
    required Widget child,
  }) : super(key: key, child: child);

  final bool isPressed;

  @override
  void applyParentData(RenderObject renderObject) {
    assert(renderObject.parentData is _ActionButtonParentData);
    final _ActionButtonParentData parentData =
    renderObject.parentData! as _ActionButtonParentData;
    if (parentData.isPressed != isPressed) {
      parentData.isPressed = isPressed;

      // Force a repaint.
      final AbstractNode? targetParent = renderObject.parent;
      if (targetParent is RenderObject) targetParent.markNeedsPaint();
    }
  }

  @override
  Type get debugTypicalAncestorWidgetClass =>
      _CupertinoDialogActionsRenderWidget;
}

class _RenderCupertinoDialogActions extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, MultiChildLayoutParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, MultiChildLayoutParentData> {
  _RenderCupertinoDialogActions({
    List<RenderBox>? children,
    required double dialogWidth,
    double dividerThickness = 0.0,
    required Color dialogColor,
    required Color dialogPressedColor,
    required Color dividerColor,
  })  : _dialogWidth = dialogWidth,
        _buttonBackgroundPaint = Paint()
          ..color = dialogColor
          ..style = PaintingStyle.fill,
        _pressedButtonBackgroundPaint = Paint()
          ..color = dialogPressedColor
          ..style = PaintingStyle.fill,
        _dividerPaint = Paint()
          ..color = dividerColor
          ..style = PaintingStyle.fill,
        _dividerThickness = dividerThickness {
    addAll(children);
  }

  double get dialogWidth => _dialogWidth;
  double _dialogWidth;
  set dialogWidth(double newWidth) {
    if (newWidth != _dialogWidth) {
      _dialogWidth = newWidth;
      markNeedsLayout();
    }
  }

  // The thickness of the divider between buttons.
  double get dividerThickness => _dividerThickness;
  double _dividerThickness;
  set dividerThickness(double newValue) {
    if (newValue != _dividerThickness) {
      _dividerThickness = newValue;
      markNeedsLayout();
    }
  }

  final Paint _buttonBackgroundPaint;
  set dialogColor(Color value) {
    if (value == _buttonBackgroundPaint.color) return;

    _buttonBackgroundPaint.color = value;
    markNeedsPaint();
  }

  final Paint _pressedButtonBackgroundPaint;
  set dialogPressedColor(Color value) {
    if (value == _pressedButtonBackgroundPaint.color) return;

    _pressedButtonBackgroundPaint.color = value;
    markNeedsPaint();
  }

  final Paint _dividerPaint;
  set dividerColor(Color value) {
    if (value == _dividerPaint.color) return;

    _dividerPaint.color = value;
    markNeedsPaint();
  }

  Iterable<RenderBox> get _pressedButtons sync* {
    RenderBox? currentChild = firstChild;
    while (currentChild != null) {
      assert(currentChild.parentData is _ActionButtonParentData);
      final _ActionButtonParentData parentData =
      currentChild.parentData! as _ActionButtonParentData;
      if (parentData.isPressed) {
        yield currentChild;
      }
      currentChild = childAfter(currentChild);
    }
  }

  bool get _isButtonPressed {
    RenderBox? currentChild = firstChild;
    while (currentChild != null) {
      assert(currentChild.parentData is _ActionButtonParentData);
      final _ActionButtonParentData parentData =
      currentChild.parentData! as _ActionButtonParentData;
      if (parentData.isPressed) {
        return true;
      }
      currentChild = childAfter(currentChild);
    }
    return false;
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! _ActionButtonParentData) {
      child.parentData = _ActionButtonParentData();
    }
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    return dialogWidth;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    return dialogWidth;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    final double minHeight;
    if (childCount == 0) {
      minHeight = 0.0;
    } else if (childCount == 1) {
      // If only 1 button, display the button across the entire dialog.
      minHeight = _computeMinIntrinsicHeightSideBySide(width);
    } else {
      if (childCount == 2 && _isSingleButtonRow(width)) {
        // The first 2 buttons fit side-by-side. Display them horizontally.
        minHeight = _computeMinIntrinsicHeightSideBySide(width);
      } else {
        // 3+ buttons are always stacked. The minimum height when stacked is
        // 1.5 buttons tall.
        minHeight = _computeMinIntrinsicHeightStacked(width);
      }
    }
    return minHeight;
  }

  // The minimum height for a single row of buttons is the larger of the buttons'
  // min intrinsic heights.
  double _computeMinIntrinsicHeightSideBySide(double width) {
    assert(childCount >= 1 && childCount <= 2);

    final double minHeight;
    if (childCount == 1) {
      minHeight = firstChild!.getMinIntrinsicHeight(width);
    } else {
      final double perButtonWidth = (width - dividerThickness) / 2.0;
      minHeight = math.max(
        firstChild!.getMinIntrinsicHeight(perButtonWidth),
        lastChild!.getMinIntrinsicHeight(perButtonWidth),
      );
    }
    return minHeight;
  }

  // The minimum height for 2+ stacked buttons is the height of the 1st button
  // + 50% the height of the 2nd button + the divider between the two.
  double _computeMinIntrinsicHeightStacked(double width) {
    assert(childCount >= 2);

    return firstChild!.getMinIntrinsicHeight(width) +
        dividerThickness +
        (0.5 * childAfter(firstChild!)!.getMinIntrinsicHeight(width));
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    final double maxHeight;
    if (childCount == 0) {
      // No buttons. Zero height.
      maxHeight = 0.0;
    } else if (childCount == 1) {
      // One button. Our max intrinsic height is equal to the button's.
      maxHeight = firstChild!.getMaxIntrinsicHeight(width);
    } else if (childCount == 2) {
      // Two buttons...
      if (_isSingleButtonRow(width)) {
        // The 2 buttons fit side by side so our max intrinsic height is equal
        // to the taller of the 2 buttons.
        final double perButtonWidth = (width - dividerThickness) / 2.0;
        maxHeight = math.max(
          firstChild!.getMaxIntrinsicHeight(perButtonWidth),
          lastChild!.getMaxIntrinsicHeight(perButtonWidth),
        );
      } else {
        // The 2 buttons do not fit side by side. Measure total height as a
        // vertical stack.
        maxHeight = _computeMaxIntrinsicHeightStacked(width);
      }
    } else {
      // Three+ buttons. Stack the buttons vertically with dividers and measure
      // the overall height.
      maxHeight = _computeMaxIntrinsicHeightStacked(width);
    }
    return maxHeight;
  }

  // Max height of a stack of buttons is the sum of all button heights + a
  // divider for each button.
  double _computeMaxIntrinsicHeightStacked(double width) {
    assert(childCount >= 2);

    final double allDividersHeight = (childCount - 1) * dividerThickness;
    double heightAccumulation = allDividersHeight;
    RenderBox? button = firstChild;
    while (button != null) {
      heightAccumulation += button.getMaxIntrinsicHeight(width);
      button = childAfter(button);
    }
    return heightAccumulation;
  }

  bool _isSingleButtonRow(double width) {
    final bool isSingleButtonRow;
    if (childCount == 1) {
      isSingleButtonRow = true;
    } else if (childCount == 2) {
      // There are 2 buttons. If they can fit side-by-side then that's what
      // we want to do. Otherwise, stack them vertically.
      final double sideBySideWidth =
          firstChild!.getMaxIntrinsicWidth(double.infinity) +
              dividerThickness +
              lastChild!.getMaxIntrinsicWidth(double.infinity);
      isSingleButtonRow = sideBySideWidth <= width;
    } else {
      isSingleButtonRow = false;
    }
    return isSingleButtonRow;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return _computeLayout(constraints: constraints, dry: true);
  }

  @override
  void performLayout() {
    size = _computeLayout(constraints: constraints, dry: false);
  }

  Size _computeLayout({required BoxConstraints constraints, bool dry = false}) {
    final ChildLayouter layoutChild =
    dry ? ChildLayoutHelper.dryLayoutChild : ChildLayoutHelper.layoutChild;

    if (_isSingleButtonRow(dialogWidth)) {
      if (childCount == 1) {
        // We have 1 button. Our size is the width of the dialog and the height
        // of the single button.
        final Size childSize = layoutChild(
          firstChild!,
          constraints,
        );

        return constraints.constrain(Size(dialogWidth, childSize.height));
      } else {
        // Each button gets half the available width, minus a single divider.
        final BoxConstraints perButtonConstraints = BoxConstraints(
          minWidth: (constraints.minWidth - dividerThickness) / 2.0,
          maxWidth: (constraints.maxWidth - dividerThickness) / 2.0,
          minHeight: 0.0,
          maxHeight: double.infinity,
        );

        // Layout the 2 buttons.
        final Size firstChildSize = layoutChild(
          firstChild!,
          perButtonConstraints,
        );
        final Size lastChildSize = layoutChild(
          lastChild!,
          perButtonConstraints,
        );

        if (!dry) {
          // The 2nd button needs to be offset to the right.
          assert(lastChild!.parentData is MultiChildLayoutParentData);
          final MultiChildLayoutParentData secondButtonParentData =
          lastChild!.parentData! as MultiChildLayoutParentData;
          secondButtonParentData.offset =
              Offset(firstChildSize.width + dividerThickness, 0.0);
        }

        // Calculate our size based on the button sizes.
        return constraints.constrain(
          Size(
            dialogWidth,
            math.max(
              firstChildSize.height,
              lastChildSize.height,
            ),
          ),
        );
      }
    } else {
      // We need to stack buttons vertically, plus dividers above each button (except the 1st).
      final BoxConstraints perButtonConstraints = constraints.copyWith(
        minHeight: 0.0,
        maxHeight: double.infinity,
      );

      RenderBox? child = firstChild;
      int index = 0;
      double verticalOffset = 0.0;
      while (child != null) {
        final Size childSize = layoutChild(
          child,
          perButtonConstraints,
        );

        if (!dry) {
          assert(child.parentData is MultiChildLayoutParentData);
          final MultiChildLayoutParentData parentData =
          child.parentData! as MultiChildLayoutParentData;
          parentData.offset = Offset(0.0, verticalOffset);
        }
        verticalOffset += childSize.height;
        if (index < childCount - 1) {
          // Add a gap for the next divider.
          verticalOffset += dividerThickness;
        }

        index += 1;
        child = childAfter(child);
      }

      // Our height is the accumulated height of all buttons and dividers.
      return constraints.constrain(Size(dialogWidth, verticalOffset));
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;

    if (_isSingleButtonRow(size.width)) {
      _drawButtonBackgroundsAndDividersSingleRow(canvas, offset);
    } else {
      _drawButtonBackgroundsAndDividersStacked(canvas, offset);
    }

    _drawButtons(context, offset);
  }

  void _drawButtonBackgroundsAndDividersSingleRow(
      Canvas canvas, Offset offset) {
    // The vertical divider sits between the left button and right button (if
    // the dialog has 2 buttons).  The vertical divider is hidden if either the
    // left or right button is pressed.
    final Rect verticalDivider = childCount == 2 && !_isButtonPressed
        ? Rect.fromLTWH(
      offset.dx + firstChild!.size.width,
      offset.dy,
      dividerThickness,
      math.max(
        firstChild!.size.height,
        lastChild!.size.height,
      ),
    )
        : Rect.zero;

    final List<Rect> pressedButtonRects =
    _pressedButtons.map<Rect>((RenderBox pressedButton) {
      final MultiChildLayoutParentData buttonParentData =
      pressedButton.parentData! as MultiChildLayoutParentData;

      return Rect.fromLTWH(
        offset.dx + buttonParentData.offset.dx,
        offset.dy + buttonParentData.offset.dy,
        pressedButton.size.width,
        pressedButton.size.height,
      );
    }).toList();

    // Create the button backgrounds path and paint it.
    final Path backgroundFillPath = Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..addRect(verticalDivider);

    for (int i = 0; i < pressedButtonRects.length; i += 1) {
      backgroundFillPath.addRect(pressedButtonRects[i]);
    }

    canvas.drawPath(
      backgroundFillPath,
      _buttonBackgroundPaint,
    );

    // Create the pressed buttons background path and paint it.
    final Path pressedBackgroundFillPath = Path();
    for (int i = 0; i < pressedButtonRects.length; i += 1) {
      pressedBackgroundFillPath.addRect(pressedButtonRects[i]);
    }

    canvas.drawPath(
      pressedBackgroundFillPath,
      _pressedButtonBackgroundPaint,
    );

    // Create the dividers path and paint it.
    final Path dividersPath = Path()..addRect(verticalDivider);

    canvas.drawPath(
      dividersPath,
      _dividerPaint,
    );
  }

  void _drawButtonBackgroundsAndDividersStacked(Canvas canvas, Offset offset) {
    final Offset dividerOffset = Offset(0.0, dividerThickness);

    final Path backgroundFillPath = Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height));

    final Path pressedBackgroundFillPath = Path();

    final Path dividersPath = Path();

    Offset accumulatingOffset = offset;

    RenderBox? child = firstChild;
    RenderBox? prevChild;
    while (child != null) {
      assert(child.parentData is _ActionButtonParentData);
      final _ActionButtonParentData currentButtonParentData =
      child.parentData! as _ActionButtonParentData;
      final bool isButtonPressed = currentButtonParentData.isPressed;

      bool isPrevButtonPressed = false;
      if (prevChild != null) {
        assert(prevChild.parentData is _ActionButtonParentData);
        final _ActionButtonParentData previousButtonParentData =
        prevChild.parentData! as _ActionButtonParentData;
        isPrevButtonPressed = previousButtonParentData.isPressed;
      }

      final bool isDividerPresent = child != firstChild;
      final bool isDividerPainted =
          isDividerPresent && !(isButtonPressed || isPrevButtonPressed);
      final Rect dividerRect = Rect.fromLTWH(
        accumulatingOffset.dx,
        accumulatingOffset.dy,
        size.width,
        dividerThickness,
      );

      final Rect buttonBackgroundRect = Rect.fromLTWH(
        accumulatingOffset.dx,
        accumulatingOffset.dy + (isDividerPresent ? dividerThickness : 0.0),
        size.width,
        child.size.height,
      );

      // If this button is pressed, then we don't want a white background to be
      // painted, so we erase this button from the background path.
      if (isButtonPressed) {
        backgroundFillPath.addRect(buttonBackgroundRect);
        pressedBackgroundFillPath.addRect(buttonBackgroundRect);
      }

      // If this divider is needed, then we erase the divider area from the
      // background path, and on top of that we paint a translucent gray to
      // darken the divider area.
      if (isDividerPainted) {
        backgroundFillPath.addRect(dividerRect);
        dividersPath.addRect(dividerRect);
      }

      accumulatingOffset += (isDividerPresent ? dividerOffset : Offset.zero) +
          Offset(0.0, child.size.height);

      prevChild = child;
      child = childAfter(child);
    }

    canvas.drawPath(backgroundFillPath, _buttonBackgroundPaint);
    canvas.drawPath(pressedBackgroundFillPath, _pressedButtonBackgroundPaint);
    canvas.drawPath(dividersPath, _dividerPaint);
  }

  void _drawButtons(PaintingContext context, Offset offset) {
    RenderBox? child = firstChild;
    while (child != null) {
      final MultiChildLayoutParentData childParentData =
      child.parentData! as MultiChildLayoutParentData;
      context.paintChild(child, childParentData.offset + offset);
      child = childAfter(child);
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }
}

class _ActionButtonParentData extends MultiChildLayoutParentData {
  _ActionButtonParentData({
    this.isPressed = false,
  });

  bool isPressed;
}