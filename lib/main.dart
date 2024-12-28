import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDarkMode = false;
  bool isTapped = false; // Track if 'I AM' is clicked

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: isDarkMode ? Colors.black : Colors.white,
          elevation: 0,
          title: Row(
            children: [
              const Text(
                'Creative',
                style: TextStyle(
                  fontFamily: 'Serif',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.blue,
                ),
              ),
              const Spacer(),
              _buildNavigation(),
              IconButton(
                icon: Icon(
                  isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    isDarkMode = !isDarkMode;
                  });
                },
              ),
            ],
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return constraints.maxWidth > 600
                ? _buildWebLayout()
                : _buildMobileLayout();
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  Icons.email,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  // Handle Mail button press
                  print("Mail button pressed");
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.code,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  // Handle GitHub button press
                  print("GitHub button pressed");
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.camera_alt,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  // Handle Instagram button press
                  print("Instagram button pressed");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigation() {
    // Check if screen is large enough (tablet or desktop)
    if (MediaQuery.of(context).size.width > 600) {
      return Row(
        children: [
          _navButton('Home'),
          _navButton('Skills'),
          _navButton('Services'),
          _navButton('Contact'),
        ],
      );
    } else {
      // For smaller screens, use the three dots menu
      return PopupMenuButton<String>(
        icon: Icon(
          Icons.more_vert,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        onSelected: (value) {
          // Handle menu item selection
        },
        itemBuilder: (BuildContext context) {
          return ['Home', 'Skills', 'Services', 'Contact'].map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList();
        },
      );
    }
  }

  Widget _navButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildWebLayout() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HEY THERE,',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'I AM ',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color:
                                isDarkMode ? Colors.grey[300] : Colors.black54,
                          )),
                      TextSpan(
                        text: 'SMITH WILLS',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Welcome to my site. I am an UI/UX designer who is willing to work with you to make your ideas brilliant.',
                  style: TextStyle(
                    fontSize: 18,
                    color: isDarkMode ? Colors.grey[300] : Colors.black54,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                  ),
                  child: const Text(
                    'Hire Me',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildStatCircle('281+', 'Projects'),
                    _buildStatCircle('2800+', 'Hours Worked'),
                    _buildStatCircle('50+', 'Clients'),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue[100],
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 120,
              backgroundImage: AssetImage('assets/smith.jpg'), // Add image
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'HEY THERE,\nI AM SMITH WILLS',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Welcome to my site. I am an UI/UX designer who is willing to work with you to make your ideas brilliant.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: isDarkMode ? Colors.grey[300] : Colors.black54,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            ),
            child: const Text(
              'Hire Me',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatCircle('281+', 'TASK Done'),
              _buildStatCircle('Over 2800', ' Clients'),
              _buildStatCircle('50+', 'Companies'),
            ],
          ),
          const SizedBox(height: 16),
          CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('assets/smith.jpg'),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCircle(String number, String label) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 9,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
