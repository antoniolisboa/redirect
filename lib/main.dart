import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(RedirectApp());
}

class RedirectApp extends StatelessWidget {
  const RedirectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _openSite(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final uri = Uri.parse('https://www.helpme.technology');

    if (!await launchUrl(
      uri,
      webOnlyWindowName: '_self',
      mode: LaunchMode.externalApplication,
    )) {
      messenger.showSnackBar(
        SnackBar(content: Text('Não foi possível abrir o link')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => _openSite(context),
        child: Text('Abrir site'),
      ),
    );
  }
}
