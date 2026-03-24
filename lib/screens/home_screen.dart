import 'package:ecard/screens/product_details_screen.dart';
import 'package:ecard/widgets/row_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var totalValue = 0;

  void increment() {
    totalValue++;
    setState(() {});
    print('Value is   $totalValue');
  }

  final List categories = ["All", "Men", "Women", "Girls"];

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
                          await fetchApiData();
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
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hint: Text(
                          'Search',
                          style: TextStyle(color: Colors.grey),
                        ),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),

                  AppBarIcon(iconData: Icons.filter_list, onTap: () {}),
                ],
              ),

              RowText(title: 'Categories', label: 'See All'),

              SizedBox(
                height: 50,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 10);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: 80,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: index == 0
                            ? Colors.deepOrange
                            : Colors.grey[200],
                      ),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          fontSize: 16,
                          color: index == 0 ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                ),
              ),

              Container(
                padding: EdgeInsets.all(12),
                height: 200,

                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Get Your\nSpecial Sale \nUp to 40%',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Shop Now'),
                        ),
                      ],
                    ),
                    Image.network(
                      'https://pngimg.com/uploads/tshirt/tshirt_PNG5454.png',
                    ),
                  ],
                ),
              ),

              RowText(title: 'Popular Product', label: 'See All'),

              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                width: MediaQuery.sizeOf(context).width,
                                height: 120,
                                'https://pngimg.com/uploads/tshirt/tshirt_PNG5449.png',
                                fit: BoxFit.contain,
                              ),

                              Positioned(
                                right: 0,
                                top: 0,
                                child: Icon(Icons.favorite_border),
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            spacing: 4,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cotton T-Shirt',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    spacing: 4,
                                    children: [
                                      Text(
                                        '\$69',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      Text(
                                        '\$189',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.deepOrange,
                                ),
                                child: Icon(
                                  
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
      print('Object ${response.body}');
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
