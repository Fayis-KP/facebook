import 'package:flutter/material.dart';

class People extends StatefulWidget {
  const People({super.key});

  @override
  State<People> createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  final List<Map<String, String>> people = [
    {"name": "Your story", "image": "assets/add_image.jpg", "description": "Add your story"},
    {"name": "John Doe", "image": "assets/person2.jpg"},
    {"name": "Jane Doe", "image": "assets/person1.jpg"},
    {"name": "Mark Smith", "image": "assets/person3.jpg"},
    {"name": "Lucy Brown", "image": "assets/person4.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/person5.jpg"),
            radius: 20,
          ),
        ),
        title: const Text(
          'People',
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
                icon: const Icon(Icons.chat, color: Colors.white),
                onPressed: () {
                  // Add your chat action here
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[800],
              child: IconButton(
                icon: const Icon(Icons.person, color: Colors.white),
                onPressed: () {
                  // Add your person action here
                },
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,  // Set the background color to black
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search,color: Colors.white,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[800],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: people.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(people[index]['image'] ?? 'assets/default.jpg'),
                                  radius: 40,
                                ),
                                if (index == 0)
                                  const Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                if (index != 0)
                                  Positioned(
                                    bottom: 2,
                                    right: 10,
                                    child: CircleAvatar(
                                      radius: 8,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        radius: 6,
                                        backgroundColor: Colors.green,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            title: Text(
                              people[index]['name'] ?? 'Unknown',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,  // Set text color to white
                              ),
                            ),
                            subtitle: index == 0
                                ? Text(
                              people[index]['description'] ?? 'Add your story',
                              style: TextStyle(color: Colors.grey[400]),  // Set subtitle color to light grey
                            )
                                : null,
                            trailing: index == 0
                                ? null
                                : CircleAvatar(
                              backgroundColor: Colors.grey[800],
                              child: const Icon(Icons.waving_hand, color: Colors.white),
                            ),
                            onTap: () {
                              // Add your action for the items here
                            },
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey[600],  // Adjust divider color for better visibility
                          ),
                        ],
                      );
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 16.0),
                    child: Text(
                      'Recently active',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,  // Set the "Recently active" text to white
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage("assets/person6.jpg"),
                        radius: 30,
                      ),
                      title: const Text(
                        'Alice Johnson',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,  // Set text color to white
                        ),
                      ),
                      trailing: CircleAvatar(
                        backgroundColor: Colors.grey[800],
                        child: const Icon(Icons.waving_hand, color: Colors.white),
                      ),
                      onTap: () {
                        // Add your action for the recently active item here
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
