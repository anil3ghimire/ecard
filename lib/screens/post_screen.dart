import 'dart:convert';

import 'package:ecard/model/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String productName = '', productDetails = '', productUrl = '', price = '';
  final _form = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test Api')),

      body: Form(
        key: _form,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Column(
            spacing: 12,
            children: [
              TextFormField(
                onSaved: (newValue) {
                  productName = newValue!;
                },
                decoration: InputDecoration(
                  hintText: 'Product Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              TextFormField(
                onSaved: (newValue) {
                  productDetails = newValue!;
                },
                decoration: InputDecoration(
                  hintText: 'Product Details',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              TextFormField(
                onSaved: (newValue) {
                  productUrl = newValue!;
                },
                decoration: InputDecoration(
                  hintText: 'Image URl',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              TextFormField(
                onSaved: (newValue) {
                  price = newValue!;
                },
                decoration: InputDecoration(
                  hintText: 'Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_form.currentState!.validate()) {
                    _form.currentState!.save();
                    postDataToApi();
                    print('DAta from textFormField$productDetails');
                  }
                },
                child: Text('Post data'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // post method

  Future<void> postDataToApi() async {
    Product product = Product(
      name: productName,
      productDescriptions: productDetails,
      productURl: productUrl,
      price: price,
    );
    isLoading = true;
    setState(() {});
    var customHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    var url = Uri.parse('http://localhost:5263/api/Product');
    var response = await http.post(
      url,
      headers: customHeaders,
      body: jsonEncode(product.toJson()),
    );
    print('$Product ${product.toJson()}');

    print('${response.statusCode}');

    if (response.statusCode == 201) {
      print(' Post To the Server  and status code is ${response.statusCode}');
    }

    isLoading = false;
    setState(() {});
  }
}
