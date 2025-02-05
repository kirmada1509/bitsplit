import 'package:riverpod_annotation/riverpod_annotation.dart';
    part 'obscure.g.dart';
@riverpod
class ObscureText extends _$ObscureText {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}