import 'package:ecard/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});
  List size = ['S', 'M', 'L', 'Xl'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarIcon(
          iconData: Icons.arrow_back,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Details'),
        actions: [AppBarIcon(iconData: Icons.share, onTap: () {})],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.network(
                        'https://pngimg.com/uploads/tshirt/tshirt_PNG5449.png',
                      ),
                    ),
                    AppBarIcon(iconData: Icons.favorite_border, onTap: () {}),
                  ],
                ),
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
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'Outerwear Men',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Text('\$86.00', style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            Text('Select Size', style: Theme.of(context).textTheme.bodyLarge),

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
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
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
                        Icon(Icons.card_travel),
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
