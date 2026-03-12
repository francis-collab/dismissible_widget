import 'package:flutter/material.dart';

void main() {
  runApp(const EmailApp());
}

class EmailApp extends StatelessWidget {
  const EmailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swipe Demo',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const InboxScreen(),
    );
  }
}

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  List<String> emails = [
    "Welcome to Flutter",
    "Your package has shipped",
    "Meeting reminder",
    "Weekend plans",
    "Discount offer inside"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inbox"),
      ),
      body: ListView.builder(
        itemCount: emails.length,
        itemBuilder: (context, index) {
          final email = emails[index];

          return Dismissible(
            key: Key(email),
            background: Container(
              color: Colors.red,
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              setState(() {
                emails.removeAt(index);
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("$email deleted")),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 6),
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.email),
                ),
                title: Text(email),
                subtitle: const Text("Swipe to delete"),
              ),
            ),
          );
        },
      ),
    );
  }
}