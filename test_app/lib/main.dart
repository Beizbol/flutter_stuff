import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/user.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod User Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserPage(),
    );
  }
}

final userProvider = StateNotifierProvider<User, UserModel>((ref) => User());

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Test Page")),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // display the user info
                Consumer(builder: (context, watch, child) {
                  final _user = watch(userProvider);
                  return Column(children: [
                    Text("Name: ${_user.name}", textScaleFactor: 1.5),
                    Text("Email: ${_user.email}", textScaleFactor: 1.5),
                  ]);
                }),
                // bottom buttons
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                          child: Icon(Icons.shuffle),
                          onPressed: () {
                            context.read(userProvider.notifier).rdmAge();
                          }),
                      Consumer(builder: (context, watch, child) {
                        final _user = watch(userProvider);
                        return Text("Age: ${_user.age}", textScaleFactor: 1.5);
                      }),
                      FloatingActionButton(
                          child: Icon(Icons.add),
                          onPressed: () {
                            context.read(userProvider.notifier).incAge();
                          })
                    ])
              ]),
        ),
      ),
    );
  }
}
