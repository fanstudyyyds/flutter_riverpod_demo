import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/page/index/modes/Index_mode.dart';

final homeIndexProvider = StateProvider<int>((ref) => 0);

// ❌ 避免使用 StateProvider 管理复杂可变状态
// final indexModeProvider = StateProvider<List<IndexMode>>((ref) {
//   return [
//     IndexMode("https://images.unsplash.com/photo-1501854140801-50d01698950b?auto=format&fit=crop&q=80&w=1200", "name", "addr", "date"),
//     IndexMode("https://images.unsplash.com/photo-1501854140801-50d01698950b?auto=format&fit=crop&q=80&w=1200", "name", "addr", "date"),
//     IndexMode("https://images.unsplash.com/photo-1501854140801-50d01698950b?auto=format&fit=crop&q=80&w=1200", "name", "addr", "date"),
//     IndexMode("https://images.unsplash.com/photo-1501854140801-50d01698950b?auto=format&fit=crop&q=80&w=1200", "name", "addr", "date")
//   ];
// });

// ✅ 使用 StateNotifierProvider 管理复杂状态
final indexModeProvider =
    StateNotifierProvider<IndexModeNotifier, IndexModeState>((ref) {
  IndexModeNotifier index = IndexModeNotifier();
  index.addItem(IndexMode(
      "https://images.unsplash.com/photo-1501854140801-50d01698950b?auto=format&fit=crop&q=80&w=1200",
      "name",
      "addr",
      "date"));
  return index;
});
