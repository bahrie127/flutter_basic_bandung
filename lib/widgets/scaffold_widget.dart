import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScaffoldWidget extends StatefulWidget {
  const ScaffoldWidget({super.key});

  @override
  State<ScaffoldWidget> createState() => _ScaffoldWidgetState();
}

class _ScaffoldWidgetState extends State<ScaffoldWidget> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Belajar Scaffold',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff9A9390),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          const Icon(Icons.logout_outlined),
          const SizedBox(
            width: 16,
          )
        ],
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 15.0, // soften the shadow
                      spreadRadius: 5.0, //extend the shadow
                      offset: Offset(
                        5.0, // Move to right 5  horizontally
                        5.0, // Move to bottom 5 Vertically
                      ),
                    )
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [
                      0.1,
                      0.4,
                      0.5,
                      0.9,
                    ],
                    colors: [
                      Colors.yellow,
                      Colors.red,
                      Colors.indigo,
                      Colors.teal,
                    ],
                  )),
              child: Text(
                'Bank Jatim, Berkembang pasti',
                textAlign: TextAlign.center,
                style: GoogleFonts.aboreto(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    textStyle: TextStyle(color: Colors.blue.shade100)),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white30,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Tranfer berhasil'),
                  backgroundColor: Colors.blue,
                ),
              );
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Transfer'),
                SizedBox(
                  width: 8,
                ),
                Icon(Icons.send)
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Klik Me'),
          ),
          const SizedBox(
            height: 16,
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Outline'),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: Image.network(
              'https://file-examples.com/storage/fede3f30f864a1f979d2bf0/2017/10/file_example_JPG_100kB.jpg',
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const CircleAvatar(
            radius: 83,
            backgroundColor: Colors.blue,
            child: CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                  'https://file-examples.com/storage/fede3f30f864a1f979d2bf0/2017/10/file_example_JPG_100kB.jpg'),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Image.asset('assets/images/gambar1.png'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_a_photo),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        currentIndex: index,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
