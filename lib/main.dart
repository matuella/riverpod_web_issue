import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Must run with --release flag
void main() {
  runApp(ProviderScope(child: App()));
}

final autoDisposeFamilyProvider =
  Provider.autoDispose.family<String, String>((_, scopedString) => scopedString);

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final crashingProvider = useProvider(autoDisposeFamilyProvider('test'));

    return MaterialApp(
      home: Scaffold(
        body: Text(crashingProvider),
      ),
    );
  }
}
