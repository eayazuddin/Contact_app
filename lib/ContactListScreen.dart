import 'package:flutter/material.dart';

class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
      name: 'John Doe',
      email: 'john.doe@example.com',
      phoneNumber: '123-456-7890',
    ),
    Contact(
      name: 'Jane Smith',
      email: 'jane.smith@example.com',
      phoneNumber: '987-654-3210',
    ),
    Contact(
      name: 'Alice Johnson',
      email: 'alice.johnson@example.com',
      phoneNumber: '555-123-4567',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: ListTile(
              title: Text(contacts[index].name),
              subtitle: Text(contacts[index].email),
              onTap: () {
                _showContactDetails(context, contacts[index]);
              },
            ),
          );
        },
      ),
    );
  }

  void _showContactDetails(BuildContext context, Contact contact) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                contact.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text('Email: ${contact.email}'),
              SizedBox(height: 8.0),
              Text('Phone: ${contact.phoneNumber}'),
            ],
          ),
        );
      },
    );
  }
}

class Contact {
  final String name;
  final String email;
  final String phoneNumber;

  Contact({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });
}


