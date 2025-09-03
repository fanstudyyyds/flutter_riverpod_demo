import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final isRunningProvider = StateProvider<bool>((ref) => false);

final remainingTimeProvider = StateProvider<int>((ref) => 0);

final buttonScaleProvider = StateProvider<double>((ref) => 1.0);

final timerProvider = StateProvider<Timer?>((ref) => null);
