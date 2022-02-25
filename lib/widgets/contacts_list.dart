import 'package:facebook/models/models.dart';
import 'package:facebook/widgets/profile_image_button.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  final List<User> users;

  const ContactsList({required this.users, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                child: Text(
                  "Contatos",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.video_call),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.more_horiz),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final User user = users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: ProfileImageButton(
                    user: user,
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
