import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imageUrls = [
    'assets/person.jpg',
    'assets/person1.jpg',
    'assets/person2.jpg',
    'assets/person3.jpg',
  ];

  final List<String> names = [
    'Alex',
    'mery',
    'martin',
    'menon',
  ];

  final List<Map<String, String>> chatData = [
    {'name': 'Alex', 'message': 'Hey, how are you?', 'image': 'assets/person.jpg'},
    {'name': 'mery', 'message': 'Are we still meeting today?', 'image': 'assets/person3.jpg'},
    {'name': 'martin', 'message': 'Let\'s catch up later!', 'image': 'assets/person4.jpg'},
    {'name': 'menon', 'message': 'Can you send me the report?', 'image': 'assets/person6.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      appBar: AppBar(backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/person5.jpg"),
            radius: 20,
          ),
        ),
        title: Text(
          'Chats',
          style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 29,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[800],
              child: IconButton(
                icon: Icon(Icons.camera_alt, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[800],
              child: IconButton(
                icon: Icon(Icons.edit, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search,color: Colors.white,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[800], // Change search bar color to blend with black background
                hintStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white), // Change text color to white
            ),
          ),
          Container(
            height: 120,
            color: Colors.black, // Set background color to black
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageUrls.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[800],
                          radius: 40,
                          child: Icon(Icons.add, color: Colors.white, size: 30),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Your story',
                          style: TextStyle(fontSize: 16, color: Colors.white), // Set text color to white
                        ),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(imageUrls[index - 1]),
                          radius: 40,
                        ),
                        Positioned(
                          bottom: 45,
                          right: 3,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                              border: Border.all(
                                color: Colors.black, // Adjust for black background
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          child: SizedBox(
                            width: 80,
                            child: Text(
                              names[index - 1],
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16, color: Colors.white), // Set text color to white
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chatData.length,
              itemBuilder: (context, index) {
                final chat = chatData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Slidable(
                    key: Key(chat['name']!),
                    startActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          icon: Icons.camera_alt,
                        ),
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          icon: Icons.phone,
                        ),
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          icon: Icons.videocam,
                        ),
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          icon: Icons.menu,
                        ),
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          icon: Icons.notifications,
                        ),
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                        ),
                      ],
                    ),
                    child: Container(
                      color: Colors.black, // Set chat row background color to black
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(chat['image']!),
                          radius: 30,
                        ),
                        title: Text(
                          chat['name']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white, // Change text color to white
                          ),
                        ),
                        subtitle: Text(
                          chat['message']!,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70, // Lighter white for subtitle
                          ),
                        ),
                        trailing: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: 10,
                          child: Icon(
                            Icons.check,
                            color: Colors.black,
                            size: 10,
                          ),
                        ),
                      ),
                    ),
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
