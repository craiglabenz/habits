// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// {@template KeyboardHider}
/// {@endtemplate}
class KeyboardHider extends StatelessWidget {
  /// {@macro KeyboardHider}
  const KeyboardHider({required this.child, super.key});

  /// Descendant UI.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Not sure why this one isn't working.
        // FocusScope.of(context).unfocus();
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: child,
    );
  }
}
