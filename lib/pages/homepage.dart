import 'package:coffee_ui/util/coffeetile.dart';
import 'package:coffee_ui/util/coffeetype.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> cofeetype = [
    //[coffe type, isSelected]
    {
      "name": 'Cappucino',
      "image": 'lib/imges/Cofee1.jpeg',
      "isSelected": true,
      "isFavourite": false
    },
    {
      "name": 'Latte',
      "image": 'lib/imges/Cofee2.jpeg',
      "isSelected": false,
      "isFavourite": false
    },
    {
      "name": 'Black',
      "image": 'lib/imges/cofee3.jpeg',
      "isSelected": false,
      "isFavourite": false
    },
    {
      "name": 'Tea',
      "image": 'lib/imges/new1.jpg',
      "isSelected": false,
      "isFavourite": false
    }
  ];
  //user tapped
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < cofeetype.length; i++) {
        cofeetype[i]["isSelected"] = false;
      }
      cofeetype[index]['isSelected'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //find the best coffee for you
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Find the best coffee for you',
              style: TextStyle(fontSize: 36),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.orange,
                  ),
                  hintText: 'Find your coffee',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600))),
            ),
          ),

          //horizental list view of cofee types
          Container(
              height: 50,
              child: ListView.builder(
                  itemCount: cofeetype.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CoffeeType(
                        coffeeType: cofeetype[index]['name'],
                        isSelcted: cofeetype[index]['isSelected'],
                        onTap: () {
                          coffeeTypeSelected(index);
                        });
                  })),

          //horizental list view of cofee tiles
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width*2/3,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: cofeetype.length,
                itemBuilder: (context, i) {
                  return CoffeeTile(
                    CoffeeImagePath: cofeetype[i]["image"],
                    CoffeeName: cofeetype[i]["name"],
                    CoffeePrice: "4",
                    imageHeight: 200, // Specify the desired image height
                    imageWidth: 200, // Specify the desired image width
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//
// Expanded(
// child: ListView(
// scrollDirection: Axis.vertical,
// children: [
// CoffeeTile(
// CoffeeImagePath: 'lib/imges/new1.jpg',
// CoffeeName: 'Latte',
// CoffeePrice: '4.00',
// ),
// CoffeeTile(
// CoffeeImagePath: 'lib/imges/new2.jpg',
// CoffeeName: 'Black',
// CoffeePrice: '5.00',
// ),
// CoffeeTile(
// CoffeeImagePath: 'lib/imges/new3.jpg',
// CoffeeName: 'Cappiciono',
// CoffeePrice: '3.00',
// ),
// CoffeeTile(
// CoffeeImagePath: 'lib/imges/robbie-down-LI8inyHnm_A-unsplash.jpg',
// CoffeeName: 'Latte',
// CoffeePrice: '7.00',
// ),
// ],
// ))
