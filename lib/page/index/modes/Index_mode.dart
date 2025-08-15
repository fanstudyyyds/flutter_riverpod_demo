import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndexMode {
  String? url;
  String? name;
  String? addr;
  String? date;

  IndexMode(this.url, this.name, this.addr, this.date);
}

// 状态模型
class IndexModeState {
  final List<IndexMode> items;

  IndexModeState(this.items);

  IndexModeState copyWith({List<IndexMode>? items}) {
    return IndexModeState(items ?? this.items);
  }
}

// StateNotifier
class IndexModeNotifier extends StateNotifier<IndexModeState> {
  IndexModeNotifier() : super(IndexModeState([]));

  void addItem(IndexMode item) {
    state = state.copyWith(items: [...state.items, item]);
  }

  int size(){
    return state.items.length;
  }

}
