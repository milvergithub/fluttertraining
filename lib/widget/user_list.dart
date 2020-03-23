import 'package:flutter/material.dart';
import 'package:insurance/models/user.dart';

Widget buildUserList(List<User> users) {
  return ListView.separated(
    padding: const EdgeInsets.all(1),
    itemCount: users.length,
    itemBuilder: (BuildContext context, int index) {
      User user = users[index];
      return Container(
        height: 50,
        color: Colors.white30,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.avatar),
            radius: 25.0,
            backgroundColor: Colors.transparent,
          ),
          title: Text(
            user.login,
            style: TextStyle(fontSize: 22.0, color: Colors.black),
          ),
          subtitle: Text(
            "ID: " + user.id.toString(),
            style: TextStyle(fontSize: 16.0, color: Colors.black87),
          ),
          trailing: IconButton(
            icon: Icon(Icons.chevron_right),
            onPressed: () {},
          ),
        ),
      );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(height: 8.0, color: Colors.transparent,),
  );
}