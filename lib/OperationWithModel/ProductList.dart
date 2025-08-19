import 'dart:convert';
 import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:product_list/OperationWithModel/user_model.dart';

class Product_list extends StatefulWidget {
  const Product_list({super.key});

  @override
  State<Product_list> createState() => _Product_listState();
}

class _Product_listState extends State<Product_list> {
  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    getApi();
  }

// getapi data ..
  Future<void> getApi() async {
    Uri u = Uri.parse('https://fakestoreapi.com/products');
    Response res = await get(u);
    if (res.statusCode == 200) {
      List<dynamic> alldata = await jsonDecode(res.body);
      setState(() {
        users = alldata.map((data) => UserModel.fromJson(data)).toList();
      });
    } else {
      debugPrint('Response code is defrent ${res.statusCode}');
    }
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar section ..
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shop),
            SizedBox(width: 5),
            Text(
              ' X Shop Products ',
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.green[100],
      ),
      //body section ..
      body: users.isEmpty
          ? const CircularProgressIndicator()
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      shrinkWrap: true,
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green[100]),
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 250,
                                        width: 300,
                                        child: user.image != null &&
                                                user.image!.isNotEmpty
                                            ? Image.network(
                                                '${user.image}',
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                   const Icon(Icons.broken_image,
                                                        size: 50),
                                              )
                                            : const Icon(Icons.image_not_supported,
                                                size: 50),
                                      ),
                                      Text('Id: ${user.id}'),
                                      SizedBox(
                                        width: 300,
                                        child: Text(
                                          'Title: ${user.title}',
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text('Price: ${user.price} \$'),
                                      Text('Catagory: ${user.category}'),
                                     
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 30)
              ],
            ),
    );
  }
}
