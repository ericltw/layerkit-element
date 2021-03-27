import 'package:flutter/widgets.dart';

import '../action_handler/index.dart';

class ChangeActiveBtnEvent extends ActionEvent {
  const ChangeActiveBtnEvent({
    @required this.index,
  }) : assert(index != null);

  final index;
}