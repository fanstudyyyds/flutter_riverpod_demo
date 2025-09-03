import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/page/list/providers/list_providers.dart';
import 'package:epub_view/epub_view.dart';

class ListPage extends ConsumerWidget {
  const ListPage({super.key});

  String _formatTime(int seconds) {
    int minutes = (seconds / 60).floor();
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _toggleTimer(WidgetRef ref) {
    final isRunning = ref.watch(isRunningProvider);
    final remainingTime = ref.watch(remainingTimeProvider);
    if (isRunning) {
      _stopTimer(ref);
    } else {
      if (remainingTime == 0) {
        _resetTimer(ref);
      }
      _startTimer(ref);
    }
  }

  // 开始计时
  void _startTimer(WidgetRef ref) {
    final remainingTime = ref.watch(remainingTimeProvider);
    ref.read(isRunningProvider.notifier).state = true;
    ref.read(timerProvider.notifier).state =
        Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        ref.read(remainingTimeProvider.notifier).state--;
      } else {
        _stopTimer(ref);
      }
    });
  }

  // 停止计时
  void _stopTimer(WidgetRef ref) {
    ref.read(timerProvider.notifier).state?.cancel();
    ref.read(isRunningProvider.notifier).state = false;
  }

  // 重置计时器
  void _resetTimer(WidgetRef ref) {
    _stopTimer(ref);
    ref.read(remainingTimeProvider.notifier).state = 25 * 60;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    final isRunning = ref.watch(isRunningProvider);

    int totalTime = 25 * 60;
    final remainingTime = ref.watch(remainingTimeProvider);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 圆形计时按钮
          GestureDetector(
            onTap: () {
              _toggleTimer(ref);
            },
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: isRunning ? Colors.red : Colors.green,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  isRunning ? '结束' : '开始',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          // 剩余时间显示
          Text(
            _formatTime(remainingTime),
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '剩余时间',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
