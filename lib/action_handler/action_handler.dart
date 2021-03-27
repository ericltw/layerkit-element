import 'package:rxdart/rxdart.dart';

import './action_event.dart';

class LEActionHandler {
  static LEActionHandler _actionHandler = LEActionHandler._internal();

  LEActionHandler._internal();

  factory LEActionHandler() {
    return _actionHandler;
  }

  final PublishSubject<ActionEvent> _eventSubject =
      PublishSubject<ActionEvent>();

  // final PublishSubject<ActionRequest> _requestSubject =
  //     PublishSubject<ActionRequest>();

  void Function(ActionEvent) get emitEvent => _eventSubject.sink.add;

  Observable<ActionEvent> get event => _eventSubject.stream;

  // void Function(ActionRequest) get emitRequest => _requestSubject.sink.add;

  // Observable<ActionRequest> get request => _requestSubject.stream;

  void dispose() {
    _eventSubject.close();
    // _requestSubject.close();
  }
}

LEActionHandler actionHandler = LEActionHandler();