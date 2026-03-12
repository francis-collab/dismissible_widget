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
    "Discount offer inside",
    "Project update from your team",
    "Your order has been confirmed",
    "Flight ticket booking details",
    "Security alert from your account",
    "Weekly newsletter",
    "Invitation to networking event",
    "Reminder: Submit your assignment",
    "Your payment receipt",
    "Flash sale starts today",
    "New comment on your post",
    "Account verification required",
    "Your subscription renewal notice",
    "New device login detected",
    "Your monthly report is ready",
    "Meeting agenda for tomorrow",
    "Event registration confirmation",
    "Your password was changed",
    "Update your profile information",
    "Daily news digest",
    "You have a new follower",
    "Promotion: 50% discount today",
    "Feedback request for our service",
    "Your delivery is on the way",
    "Team collaboration update",
    "Welcome to our community"
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