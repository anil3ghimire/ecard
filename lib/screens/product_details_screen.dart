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
              height: 40,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(width: 5);
                },
                scrollDirection: Axis.horizontal,

                itemCount: size.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      size[index],
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                },
              ),
            ),

            Container(
              height: 40,
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Text('-'),
                  ),
                ],
              ),
            ),
            Text('D', maxLines: 4),
          ],
        ),
      ),
    );
  }
}
