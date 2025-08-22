import 'package:flutter/material.dart';

void main() {
  runApp(const StudentApp());
}

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Info Manager',
      home: const StudentHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  // Data
  String name = "Grant Kwame Ofosu";
  String course = "Mobile Application Developmet";
  String university = "UENR";

  // Counter
  int count = 0;

  // Form controllers
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _pwdCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Info Manager")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Codes for "Welcome Dashboard"
            Text("Name: $name"),
            Text("Course: $course"),
            Text("University: $university"),
            const SizedBox(height: 20),

            /// Codes to Show Alert
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Hello, $name! Welcome to the Student Info Manager.")),
                );
              },
              child: const Text("Show Alert"),
            ),
            const SizedBox(height: 20),

            /// c) Student Counter
            Text("Students Enrolled: $count", style: const TextStyle(fontSize: 18)),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (count > 0) count--;
                    });
                  },
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// d) Login Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailCtrl,
                    decoration: const InputDecoration(labelText: "Email"),
                    validator: (val) {
                      if (val == null || val.isEmpty) return "Enter email";
                      if (!val.contains("@")) return "Invalid email";
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _pwdCtrl,
                    decoration: const InputDecoration(labelText: "Password"),
                    obscureText: true,
                    validator: (val) {
                      if (val == null || val.isEmpty) return "Enter password";
                      if (val.length < 6) return "Password too short";
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Login successful")),
                        );
                      }
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            /// e) Profile Picture
            const Text("Profile Picture:"),
            const SizedBox(height: 10),
            Center(
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-HxcNc7yqnTrxxEBaBz0ICDBEx8VzwJopfQ&s",
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
