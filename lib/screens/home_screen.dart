import 'dart:convert';
import 'package:ecard/model/user/user.dart';
import 'package:ecard/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var totalValue = 0;
  bool isLoading = true;
  void increment() {
    totalValue++;
    setState(() {});
    print('Value is   $totalValue');
  }
  

  final List categories = ["All", "Men", "Women", "Girls"];
  List<User> user = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchApiData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/1516680/pexels-photo-1516680.jpeg',
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello Alex',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'Good Morning',

                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      AppBarIcon(
                        // iconColor: Colors.amber,
                        iconData: Icons.local_mall,
                        onTap: () async {
                          // await fetchApiData();
                        },
                      ),
                      SizedBox(width: 5),
                      AppBarIcon(
                        // bgColor: Colors.red,
                        iconData: Icons.badge,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(
                height: 500,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(),
                      ),
                    );
                  },
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: user.length,
                    itemBuilder: (context, index) {
                      var finalUser = user[index];
                      return isLoading
                          ? CircularProgressIndicator()
                          : ListTile(
                              leading: CircleAvatar(
                                child: Text(finalUser.id.toString()),
                              ),
                              title: Text(finalUser.name ?? 'n/a'),
                              trailing: Text(
                                finalUser.company!.name.toString(),
                              ),
                              subtitle: Text(
                                finalUser.address!.geo!.lat.toString(),
                              ),
                            );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> fetchApiData() async {
    // var url =
    //   Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
    var customHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer YOUR_TOKEN', // Example if needed
    };
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users#');
    var response = await http.get(url, headers: customHeaders);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      user = data.map((e) => User.fromMap(e)).toList();
      isLoading = false;
      setState(() {});

      // for (var e in data) {
      //   user = User.fromMap(e) as List<User>;
      // }
      // setState(() {});
      print('Object ${user.length}');
      print('Object ${user[0].name}');
    }
  }
}

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({
    super.key,
    required this.iconData,
    required this.onTap,
    this.bgColor,
    this.iconColor,
  });

  final IconData iconData;
  final VoidCallback onTap;
  final Color? bgColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(onPressed: onTap, icon: Icon(iconData)),
    );
  }
}
