import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateProvider = StateProvider<String>((ref) {
  return 'YY/MM/DD';
});

final timeProvider = StateProvider<String>((ref) {
  return 'HH:SS';
});
