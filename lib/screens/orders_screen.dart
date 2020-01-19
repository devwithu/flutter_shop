import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/orders.dart' show Orders;
import 'package:flutter_shop/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routerName = '/orders';

  @override
  Widget build(BuildContext context) {
    print('building orders');

    //final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx,dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          } else {

            if(dataSnapshot.error != null) {
              return Center(
                child: Text('An error occured'),
              );
            } else {
              return Consumer<Orders>(
                builder: (ctx, orderData, child) =>  ListView.builder(
                  itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
                  itemCount: orderData.orders.length,
                ),
              ) ;
            }
          }
        },
      )
    );
  }
}
