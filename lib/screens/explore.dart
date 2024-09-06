import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  int _selectedIndex = 0; // Index to keep track of the selected tab

  // Sample data for the ListView.builder
  final List<Map<String, String>> _listItems = [
    {
      'image': 'assets/whatsapp.jpeg',
      'text': 'Whatsapp',
      'description': 'Bringing you closer to the people.'
    },
    {
      'image': 'assets/netflix1.png',
      'text': 'Netflix',
      'description': 'Netflix magic right at your fingertip.'
    },
    {
      'image': 'assets/insta.png',
      'text': 'Instagram',
      'description': 'Bringing you closer to the people.'
    },
    {
      'image': 'assets/kfc.png',
      'text': "KFC",
      'description': 'Best food.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      appBar: AppBar(
        backgroundColor: Colors.black, // Set AppBar background to black
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/person5.jpg"),
            radius: 20,
          ),
        ),
        title: const Text(
          'Discover',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 29,
            color: Colors.white, // Set text color to white for contrast
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.white70), // Hint color for visibility
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[800], // Darker color for the search bar background
              ),
              style: TextStyle(color: Colors.white), // Set input text color to white
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  child: Container(
                    height: 30,
                    width: 170,
                    decoration: BoxDecoration(
                      color: _selectedIndex == 0
                          ? Colors.grey[700]
                          : Colors.grey[800], // Darker grey for unselected
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "FOR YOU",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // White text color for visibility
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  child: Container(
                    height: 30,
                    width: 160,
                    decoration: BoxDecoration(
                      color: _selectedIndex == 1
                          ? Colors.grey[700]
                          : Colors.grey[800],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "BUSINESSES",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _selectedIndex == 0
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Recent',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text for visibility
                    ),
                  ),
                ),
                SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                            AssetImage("assets/vivo.png"),
                            radius: 30,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Vivo',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white, // White text for visibility
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                            AssetImage("assets/x.png"),
                            radius: 30,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'X',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                            AssetImage("assets/apple.png"),
                            radius: 30,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Apple',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "More",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white, // White text for "More"
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: _listItems.length,
                    itemBuilder: (context, index) {
                      final item = _listItems[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(item['image']!),
                          radius: 30,
                        ),
                        title: Text(
                          item['text']!,
                          style: TextStyle(color: Colors.white), // White text for list items
                        ),
                        subtitle: Text(
                          item['description']!,
                          style: TextStyle(color: Colors.white70), // Lighter white for description
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
                : Center(
              child: Text(
                'Content for BUSINESSES',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text for visibility
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
