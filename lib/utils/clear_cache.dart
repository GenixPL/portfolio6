import 'dart:js_interop';

import 'package:web/web.dart' as web;

Future<void> clearCache() async {
  try {
    final registrations = (await web.window.navigator.serviceWorker.getRegistrations().toDart).toDart;
    for (final registration in registrations) {
      await registration.unregister().toDart;
    }

    final keys = (await web.window.caches.keys().toDart).toDart;
    for (final key in keys) {
      await web.window.caches.delete(key.toDart).toDart;
    }

    web.window.localStorage.clear();
    web.window.sessionStorage.clear();

    // Standalone PWAs (esp. iOS) keep serving the HTTP-cached app shell on a plain reload,
    // so force-refresh the main files in the HTTP cache first.
    for (final file in ['./', 'flutter_bootstrap.js', 'flutter.js', 'main.dart.js']) {
      try {
        await web.window.fetch(file.toJS, web.RequestInit(cache: 'reload')).toDart;
      } catch (_) {
        // Best effort.
      }
    }
  } catch (_) {
    // Reload anyway.
  }

  // A new URL bypasses the cached document; plain reload() can return the stale one in a PWA.
  final url = Uri.base.replace(queryParameters: {'v': DateTime.now().millisecondsSinceEpoch.toString()});
  web.window.location.replace(url.toString());
}
