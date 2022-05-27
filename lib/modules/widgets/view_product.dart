import 'package:flutter/material.dart';
import 'package:seller_app/modules/models/product.dart';
import 'package:seller_app/modules/repository/product_repo.dart';

class ViewProduct extends StatelessWidget {
  const ViewProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductRepository repo = ProductRepository();
    return Container(
      child: FutureBuilder(
        future: repo.read(), // Firebase read operation , which give future
        builder: (BuildContext ctx, AsyncSnapshot<List<Product>> snapshot) {
          ConnectionState state = snapshot.connectionState;

          if (state == ConnectionState.waiting) {
            // Loading
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            print('Error Details....');
            print(snapshot.error);
            return const Center(
              child: Text(
                'Some Error in Product Reterive',
                style: TextStyle(fontSize: 40, color: Colors.red),
              ),
            );
          } else {
            // It has Data
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext b, int index) {
                return ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
                    ],
                  ),
                  leading: Container(
                    child: Image.network(snapshot.data![index].url),
                  ),
                  title: Text(snapshot.data![index].name),
                  subtitle: Text(snapshot.data![index].desc),
                );
              },
            );
          }
        },
      ),

      // child: Text(
      //   'View Product',
      //   style: TextStyle(fontSize: 40),
      // ),
    );
  }
}
