import 'package:flutter/material.dart';
import 'package:presentation/utils/extension/build_context_extension.dart';
import 'package:presentation/utils/typedef/typedefs.dart';

final class CsTapBuilder extends StatefulWidget {
  final BoolWidgetBuilder builder;

  const CsTapBuilder({
    super.key,
    required this.builder,
  });

  @override
  State<CsTapBuilder> createState() => _CsTapBuilderState();
}

final class _CsTapBuilderState extends State<CsTapBuilder> {
  var _isTapped = false;

  @override
  Widget build(BuildContext context) => Listener(
    onPointerDown: (_) => _onPointerDown(),
    onPointerMove: (_) => context.isIos ? _onPointerCancel() : null,
    onPointerUp: (_) => _onPointerUp(),
    onPointerCancel: (_) => _onPointerCancel(),
    child: widget.builder(_isTapped),
  );

  void _onPointerDown() => setState(() => _isTapped = true);

  void _onPointerUp() => setState(() => _isTapped = false);

  void _onPointerCancel() => setState(() => _isTapped = false);
}
