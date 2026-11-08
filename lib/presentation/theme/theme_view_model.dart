import 'package:flutter/material.dart';
import 'package:lab5_prm/data/repositories/theme_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_view_model.g.dart';

@Riverpod(keepAlive: true)
class ThemeViewModel extends _$ThemeViewModel {
  @override
  Future<ThemeMode> build() async {
    final isDarkMode = await ref.watch(themeRepositoryProvider).loadDarkMode();
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> setDarkMode(bool isDarkMode) async {
    final repository = ref.read(themeRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await repository.saveDarkMode(isDarkMode);
      return isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }
}
