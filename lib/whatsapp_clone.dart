import 'package:flutter/material.dart';
import 'package:non_func_wa_clone/individ_profile.dart';

int temp = 0;

List<String> contacts = List.filled(50, 'test');
List<String> l1 = ['All', 'Unread', 'Favourites', 'Groups', ''];

class WhatsappClone extends StatefulWidget {
  const WhatsappClone({super.key});

  @override
  State<WhatsappClone> createState() => _WhatsappCloneState();
}

class _WhatsappCloneState extends State<WhatsappClone> {
  int bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Whatsapp',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 174, 89),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.camera_alt_outlined),
          ),
          Icon(Icons.more_vert),
        ],
      ),
      body: myBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: bottomNavIndex,
        onTap: (index) {
          setState(() {
            bottomNavIndex = index;
          });
        },
        selectedItemColor: Color.fromARGB(255, 0, 174, 89),
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Updates'),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Communities',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
        ],
      ),
    );
  }

  Widget myBody() {
    if (bottomNavIndex == 0) {
      return chats();
    } else if (bottomNavIndex == 1) {
      return updates();
    } else if (bottomNavIndex == 2) {
      return communities();
    } else if (bottomNavIndex == 3) {
      return calls();
    }
    return chats();
  }

  Widget chats() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Color.fromARGB(255, 89, 98, 105)),
              ),
              hintText: 'Ask Meta AI or Search',
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 8),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: l1.length,
            itemBuilder: (context, index) {
              if (l1[index] != '') {
                return Padding(
                  padding: const EdgeInsets.only(right: 9.5),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(side: BorderSide(width: 1)),
                    child: Text(
                      l1[index],
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(right: 9.5),
                child: IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(side: BorderSide(width: 1)),
                  icon: Icon(Icons.add, color: Colors.black),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: contacts.length,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) =>
                            IndividProf(text: 'Contact', i: index + 1),
                      ),
                    );
                  },
                  trailing: Text('12:00 PM'),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: index % 2 == 0
                          ? Color.fromARGB(255, 118, 209, 173)
                          : Color.fromARGB(255, 246, 245, 243),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  leading: (index % 2 == 0)
                      ? Image.asset('assets/images/WAC2.png')
                      : Image.asset('assets/images/WAC1.png'),
                  title: Text(
                    'Contact ${(index + 1)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Hello! How are you?'),
                  tileColor: index % 2 == 0
                      ? Color.fromARGB(255, 118, 209, 173)
                      : Color.fromARGB(255, 246, 245, 243),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget updates() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: 'Search updates',
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: contacts.length,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: index % 2 == 0
                          ? Color.fromARGB(255, 246, 245, 243)
                          : Color.fromARGB(255, 118, 209, 173),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  leading: index % 2 == 0
                      ? Image.asset('assets/images/WAC1.png')
                      : Image.asset('assets/images/WAC2.png'),
                  title: Text(
                    'Contact ${(index + 1)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Updated their status'),
                  trailing: Text('${index + 1}h ago'),
                  tileColor: index % 2 == 0
                      ? Color.fromARGB(255, 118, 209, 173)
                      : Color.fromARGB(255, 246, 245, 243),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget communities() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: 'Search communities',
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: contacts.length,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            itemBuilder: (context, index) {
              if (index % 2 == 0) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromARGB(255, 246, 245, 243),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    leading: Icon(
                      Icons.groups,
                      size: 40,
                      color: Color.fromARGB(255, 246, 245, 243),
                    ),
                    title: Text(
                      'Community ${(index + 1)}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${(index + 1) * 5} members'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    tileColor: Color.fromARGB(255, 118, 209, 173),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromARGB(255, 118, 209, 173),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    leading: Icon(
                      Icons.groups,
                      size: 40,
                      color: Color.fromARGB(255, 0, 174, 89),
                    ),
                    title: Text(
                      'Community ${(index + 1)}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${(index + 1) * 5} members'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    tileColor: Color.fromARGB(255, 246, 245, 243),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget calls() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: 'Search calls',
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: contacts.length,
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            itemBuilder: (context, index) {
              if (index % 2 == 0) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromARGB(255, 246, 245, 243),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    leading: Image.asset('assets/images/WAC2.png'),
                    title: Text(
                      'Contact ${(index + 1)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: index % 6 == 0 ? Colors.red : Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      index % 6 == 0 ? 'Missed call' : 'Incoming call',
                    ),
                    trailing: Icon(
                      Icons.call,
                      color: Color.fromARGB(255, 246, 245, 243),
                    ),
                    tileColor: Color.fromARGB(255, 118, 209, 173),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromARGB(255, 118, 209, 173),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    leading: Image.asset('assets/images/WAC2.png'),
                    title: Text(
                      'Contact ${(index + 1)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: index % 5 == 0 ? Colors.red : Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      index % 5 == 0 ? 'Missed call' : 'Incoming call',
                    ),
                    trailing: Icon(
                      Icons.call,
                      color: Color.fromARGB(255, 0, 174, 89),
                    ),
                    tileColor: Color.fromARGB(255, 246, 245, 243),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
