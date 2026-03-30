import 'dart:convert';

import 'package:ecard/api_service.dart';
import 'package:ecard/model/post/post.dart';
import 'package:ecard/model/product.dart';
import 'package:ecard/screens/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllApiScreen extends StatefulWidget {
  const AllApiScreen({super.key});

  @override
  State<AllApiScreen> createState() => _AllApiScreenState();
}

class _AllApiScreenState extends State<AllApiScreen> {
  @override
  void initState() {
    super.initState();
    // getPostData();
    // loadData();
    createPost();
  }

  List<Post> post = [];

  List<Product> product = [];
  bool isLoading = false;
  var baseUrl = 'https://jsonplaceholder.typicode.com/posts';
  final api = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Api Call')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Wrap(
              spacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () {
                    getPostData();
                  },
                  child: Text('Get'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // postDataToApi();

                    //

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PostScreen()),
                    );
                  },
                  child: Text('Post'),
                ),
                ElevatedButton(
                  onPressed: () {
                    updatePost();
                  },
                  child: Text('Put'),
                ),
                ElevatedButton(
                  onPressed: () {
                    updatePost();
                  },
                  child: Text('Delete'),
                ),
              ],
            ),

            isLoading
                ? LinearProgressIndicator()
                : SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    child: ListView.builder(
                      itemCount: product.length,
                      itemBuilder: (context, index) {
                        var products = product[index];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.amber,
                                      child: Text(products.name ?? ''),
                                    ),
                                    Flexible(
                                      child: Text(
                                        products.productDescriptions ?? 'n/a',
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
                  ),
          ],
        ),
      ),
    );
  }

  // get method
  Future<void> getPostData() async {
    isLoading = true;
    setState(() {});
    var customHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer YOUR_TOKEN', // Example if needed
    };
    var url = Uri.parse('$baseUrl/post');
    var response = await http.get(url, headers: customHeaders);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      product = data.map((e) => Product.fromJson(e)).toList();
      await Future.delayed(Duration(seconds: 3));
      print('Get post from api and status code is ${data}');
      isLoading = false;
      setState(() {});
    }
    isLoading = false;
    setState(() {});
  }
  // post method

  Future<void> postDataToApi() async {
    isLoading = true;
    setState(() {});
    var customHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    Post p1 = Post(
      userId: 12,
      id: 1,
      title: 'This is a title',
      body: 'This is a body',
    );

    var url = Uri.parse('$baseUrl/posts');
    var response = await http.post(
      url,
      headers: customHeaders,
      body: jsonEncode(p1.toJson()),
    );
    print('${response.statusCode}');

    if (response.statusCode == 201) {
      print(' Post To the Server  and status code is ${response.statusCode}');
    }

    isLoading = false;
    setState(() {});
  }

  // get method

  Future<void> updatePost() async {
    setState(() => isLoading = true);
    var url = Uri.parse('$baseUrl/posts/1');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json '},
      body: jsonEncode({
        "title": "New Post",
        "body": "This is created",
        "userId": 1,
      }),
    );

    setState(() => isLoading = false);
    print('Response for put is ${response.statusCode}');
  }

  Future<void> deletePost() async {
    setState(() => isLoading = true);
    var url = Uri.parse('$baseUrl/posts/1');
    final response = await http.delete(
      url,
      headers: {'Content-Type': 'application/json '},
    );
    print(' Delete Response for Delete is is ${response.statusCode}');

    setState(() => isLoading = false);
  }

  void loadData() async {
    var response = await api.get('/posts');
    if (response != null) {
      List data = response.data;
      post = data.map((e) => Post.fromMap(e)).toList();

      print(response.data);
    }
  }

  Post p1 = Post(
    userId: 12,
    id: 1,
    title: 'This is a title',
    body: 'This is a body',
  );

  void createPost() async {
    var response = await api.post("/posts", p1.toMap());
    if (response != null) {
      print(response.data);
    }
  }
}
