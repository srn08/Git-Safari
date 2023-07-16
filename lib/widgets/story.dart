import 'package:flutter/material.dart';
import 'package:gitsafari/utils/appwrite/avatar_api.dart';

class StoryWid extends StatelessWidget {
  final String username;
  const StoryWid({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final AvatarAPI avatars = AvatarAPI();
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Color(0xff111625),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: FutureBuilder(
              future: avatars.getInitialsAvatar(username),
              //works for both public file and private file, for private files you need to be logged in
              builder: (context, snapshot) {
                Widget child = snapshot.hasData && snapshot.data != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.memory(
                          height: 32,
                          snapshot.data!,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 8,
                          child: CircularProgressIndicator(),
                        ),
                      );
                return AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: child,
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              username,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
