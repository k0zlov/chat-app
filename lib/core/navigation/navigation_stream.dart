import 'dart:async';

import 'package:flutter/material.dart';

/// A class that extends `ChangeNotifier` to allow objects listening to it to be
/// notified when the given stream emits new events.
class NavigationRefreshStream extends ChangeNotifier {
  /// Constructs a [NavigationRefreshStream] and starts listening
  /// to the provided [stream].
  /// When the [stream] emits, it notifies all its listeners.
  NavigationRefreshStream({required Stream<dynamic> stream}) {
    // Notifies listeners immediately upon creation.
    notifyListeners();
    // Subscribes to the stream and converts it into a broadcast stream if
    // it is not already. When the stream emits data, it notifies all listeners.
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  /// The stream subscription to listen to the stream events.
  StreamSubscription<dynamic>? _subscription;

  /// Overrides the `dispose` method to cancel the stream subscription when
  /// the `GoRouterRefreshStream` is disposed of, then calls `super.dispose()`
  /// to clean up the `ChangeNotifier`.
  @override
  void dispose() {
    _subscription?.cancel(); // Cancels the subscription to the stream.
    super.dispose(); // Calls the dispose method of `ChangeNotifier`.
  }
}
