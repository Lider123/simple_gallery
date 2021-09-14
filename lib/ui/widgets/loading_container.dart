import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  late final bool _isLoading;
  late final Widget _child;

  LoadingContainer({
    Key? key,
    required bool isLoading,
    required Widget child
  }) : super(key: key) {
    _isLoading = isLoading;
    _child = child;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> stackChildren = [
      _child
    ];
    if (_isLoading) stackChildren.add(const CircularProgressIndicator());
    return Stack(
      alignment: Alignment.center,
      children: stackChildren
    );
  }
}
