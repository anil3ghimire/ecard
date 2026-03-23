






 final Color? iconColor;
  final Color? bgColor;



 Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetailsScreen();
                          },
                        ),
                      );





appBar: AppBar(
        leading: AppBarIcon(iconData: Icons.add_ic_call_outlined, onTap: () {}),
        title: Text('DEtails'),
        actions: [
          AppBarIcon(iconData: Icons.add_ic_call_outlined, onTap: () {}),
        ],
      ),

 Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: Colors.grey,
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  AppBarIcon(iconData: Icons.filter, onTap: () {}),
                ],
              ),



import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

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
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.notification_important_rounded),
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),

                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.badge),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20),
              RowText(title: 'Categories', label: 'See All'),
              SizedBox(height: 20),
              SizedBox(
                height: 60,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 10);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      // margin: EdgeInsets.symmetric(horizontal: 10),
                      width: 80,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        // shape: BoxShape.circle,
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
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(12),
                height: 200,
                width: MediaQuery.sizeOf(context).width * 0.90,
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Text(
                          'Get Your \nSpecial Sale \nUp to 40 %',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,

                            fontSize: 18,
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          style: ButtonStyle(),
                          onPressed: () {},
                          child: Text('Show Now'),
                        ),
                      ],
                    ),
                    Image.network(
                      'https://pngimg.com/uploads/tshirt/tshirt_PNG5454.png',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              RowText(title: 'Popular Product', label: 'See All'),
              SizedBox(height: 20),

              SizedBox(
                child: GridView.builder(

                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 200,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// 🔥 IMAGE (FIXED)
                          Expanded(
                            child: Stack(
                              children: [
                                Image.network(
                                  'https://pngimg.com/uploads/tshirt/tshirt_PNG5449.png',
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Icon(Icons.favorite_border),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),

                          Row(
                            children: [
                              Column(
                                children: [
                                  /// 🔥 TEXT + PRICE
                                  const Text(
                                    "Cotton T-Shirt",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 4),
                                  Row(
                                    children: const [
                                      Text(
                                        "\$69.00",
                                        style: TextStyle(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        "\$189.00",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(width: 4),
                              Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.deepOrange,
                                ),
                                child: Icon(
                                  Icons.badge,
                                  size: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RowText extends StatelessWidget {
  const RowText({super.key, required this.title, required this.label});
  final String title;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(label),
      ],
    );
  }
}



import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});

  List size = ['S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey[200],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(2),
                      padding: EdgeInsets.all(12),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Image.network(
                        'https://pngimg.com/uploads/tshirt/tshirt_PNG5449.png',
                      ),
                    ),
                  ),
                  Icon(Icons.favorite_border),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cotton T-Shirt',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Outerwear Men',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Text(
                  '\$86.00',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              'Select Size',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            SizedBox(
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 6);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: size.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        width: 55,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: index == 2
                              ? Colors.deepOrange
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          size[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: index == 2 ? Colors.white : Colors.black,
                          ),
                        ),
                      );
                    },
                  ),

                  Container(
                    width: 100,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.all(4),
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: Text('-'),
                        ),
                        Text('1'),
                        Container(
                          margin: EdgeInsets.all(4),
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: Text('+'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              strutStyle: StrutStyle(fontSize: 18),
              'HEllo is more than just a tool - its a gateway to a transformed workday. With its advanced capabilities, youll breeze through tasks, crush deadlines, and reclaim your time. Whether youre an entrepreneur, student, or professional, HEllo empowers you to conquer the day and achieve your goals with ease.',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: BoxBorder.all(color: Colors.black, width: 2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.abc_rounded),
                        Text(
                          'Add To Cart',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.badge, color: Colors.white),
                        Text(
                          'Buy Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
