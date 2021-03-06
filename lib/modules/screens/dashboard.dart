import 'package:flutter/material.dart';
import 'package:seller_app/modules/widgets/add_product.dart';
import 'package:seller_app/modules/widgets/view_product.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<Map<String, dynamic>> _loadAllPages() {
    return [
      {
        'page': AddProduct(refeshChild),
        'title': 'Add Product',
        'icon': Icons.add
      },
      {'page': ViewProduct(), 'title': 'View Product', 'icon': Icons.list},
    ];
  }

  late List<Map<String, dynamic>> _allPages = _loadAllPages();
  initState() {
    super.initState();
  }

  refeshChild() {
    setState(() {});
  }

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String userid = arguments['userid'];
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
            child: UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  maxRadius: 40,
                  backgroundImage: NetworkImage(
                      'https://cdn5.vectorstock.com/i/1000x1000/51/99/icon-of-user-avatar-for-web-site-or-mobile-app-vector-3125199.jpg'),
                ),
                accountName: Text(
                  userid.split('@')[0],
                  style: TextStyle(fontSize: 30),
                ),
                accountEmail: Text(userid, style: TextStyle(fontSize: 30)))),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentPage,
            onTap: (int currentPageIndex) {
              currentPage = currentPageIndex;
              setState(() {});
            },
            items: _allPages
                .map((element) => BottomNavigationBarItem(
                    icon: Icon(element['icon']), label: element['title']))
                .toList()

            //[
            /* BottomNavigationBarItem(
                icon: Icon(Icons.add), label: 'Add Product'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'View Product')
          */
            //],
            ),
        //body: SafeArea(child: AddProduct()),
        body: SafeArea(child: _allPages[currentPage]['page']));
  }
}
