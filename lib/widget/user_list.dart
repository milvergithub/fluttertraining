import 'package:flutter/material.dart';
import 'package:insurance/models/user.dart';

Widget buildUserList(List<User> users) {
  return Expanded(
    child: ListView.separated(
      itemCount: users.length,
      itemBuilder: (BuildContext context, index) {
        User user = users[index];
        return Container(
          color: Colors.white30,
          child: ListTile(
            leading: CircleAvatar(
              child: Image.network(user.avatar,),
              radius: 30.0,
              backgroundColor: Colors.blue[50],
            ),
            title: Text(user.login,style: TextStyle(fontSize: 22.0, color: Colors.black),),
            subtitle: Text("ID: " + user.id.toString(), style: TextStyle(fontSize: 16.0, color: Colors.black87),),
            trailing: IconButton(icon: Icon(Icons.chevron_right), onPressed: () {},),
          ),
        );
      },
      separatorBuilder: (BuildContext context, index) {
        return Divider(height: 8.0, color: Colors.transparent,);
      },
    ),
  );
}