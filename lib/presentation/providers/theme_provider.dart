import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final themeProvider = StateProvider((ref) => false);

final themeColorsProvider = StateProvider((ref) => colors);

final colorSelectedProvider = StateProvider((ref) => 0);