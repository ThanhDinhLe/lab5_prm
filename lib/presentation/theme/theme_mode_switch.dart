import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lab5_prm/presentation/theme/theme_view_model.dart';

class ThemeModeSwitch extends ConsumerWidget {
  const ThemeModeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeViewModelProvider);
    final isDarkMode = themeState.value == ThemeMode.dark;

    return Tooltip(
      message: 'Chế độ tối',
      child: Switch(
        value: isDarkMode,
        onChanged: themeState.isLoading
            ? null
            : (value) {
                ref.read(themeViewModelProvider.notifier).setDarkMode(value);
              },
      ),
    );
  }
}
