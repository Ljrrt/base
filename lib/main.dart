import 'dart:developer' as devtools show log;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ljrrt/state/auth/providers/auth_state_provider.dart';
import 'package:ljrrt/state/auth/providers/is_logged_in_provider.dart';

import 'firebase_options.dart';

//simplify print with log devtools
extension Log on Object {
  void log() => devtools.log(toString());
}

// Run app after firebase init
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: App()));
}

// Main app using MaterialApp

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        body: Consumer(builder: (context, ref, child) {
          final isLoggedIn = ref.watch(isLoggedInProvider);
          if (!isLoggedIn) {
            return const MainView();
          } else {
            return const LogInView();
          }
        }),
      ),
    );
  }
}

// Log in view, where user can log in or sign in

class LogInView extends ConsumerWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: OutlinedButton(
        //even if it is an async function, we can just pass the function reference and keep going
        onPressed: ref.read(authStateProvider.notifier).loginWithGoogle,
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Text('Sign in with Google'),
        ),
      ),
    );
  }
}

// Main view, where user can log out

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext contextm, WidgetRef ref) {
    return Center(
        child: OutlinedButton(
      onPressed: ref.read(authStateProvider.notifier).logOut,
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          'Log out',
          style: TextStyle(color: Colors.red),
        ),
      ),
    ));
  }
}

// we dont actually need navigation between views, by simply changing the state of the notifier,
// the homepage will be refreshed as is in a consumer of is logged in notifier.
