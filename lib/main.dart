import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lab5_prm/presentation/photo_list/photo_list_screen.dart';
import 'package:lab5_prm/presentation/theme/theme_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: Lab5App()));
}

class Lab5App extends ConsumerWidget {
  const Lab5App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode =
        ref.watch(themeViewModelProvider).value ?? ThemeMode.light;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 5 - Photos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: themeMode,
      home: const PhotoListScreen(),
    );
  }
}
