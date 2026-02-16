import 'package:flutter_riverpod/legacy.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);
final selectedColorProvider = StateProvider<int>((ref) => 4);
