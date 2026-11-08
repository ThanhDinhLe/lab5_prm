import 'package:lab5_prm/data/services/preferences_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_repository.g.dart';

@Riverpod(keepAlive: true)
ThemeRepository themeRepository(Ref ref) {
  return ThemeRepository(ref.watch(preferencesServiceProvider));
}

class ThemeRepository {
  ThemeRepository(this._service);

  final PreferencesService _service;

  Future<bool> loadDarkMode() => _service.loadDarkMode();

  Future<void> saveDarkMode(bool isDarkMode) {
    return _service.saveDarkMode(isDarkMode);
  }
}
