import 'package:flutter/material.dart';
import 'package:masmas_food/models/restaurant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../models/restaurant.dart';
import '../global/app_color.dart';
import 'package:provider/provider.dart';

class SearcherWidget extends StatelessWidget {
  const SearcherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: RestaurantSearch());
      },
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          height: 8.h,
          decoration: BoxDecoration(
              color: const Color(0xfffef6ed),
              borderRadius: BorderRadius.circular(15)),
          margin: const EdgeInsets.all(10),
          child: Row(
            children: const [
              Icon(Icons.search, color: orangeColor1, size: 30),
              Text("What do you want to order?"),
            ],
          )

          // TextField(
          //   onTap: () {
          //     showSearch(context: context, delegate: RestaurantSearch());
          //   },
          //   decoration: const InputDecoration(
          //       border: InputBorder.none,
          //       icon: Icon(
          //         Icons.search,
          //         color: orangeColor1,
          //         size: 30,
          //       ),
          //       hintText: "What do you want to order?"),
          // ),
          ),
    );
  }
}

class RestaurantSearch extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.tune, color: orangeColor2),
      )
    ];
    //throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.location_city, size: 120),
          const SizedBox(height: 48),
          Text(
            query,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 64,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
    // final restaurant =
    //     Provider.of<Restaurants>(context).searchRestaurants(query);

    // if (restaurant.isEmpty) {
    //   return const Text("No results found");
    // } else {
    //   return ListView.builder(
    //     itemCount: restaurant.length,
    //     itemBuilder: (context, i) => ListTile(
    //       leading: Image.network(
    //         restaurant[i].img,
    //         fit: BoxFit.cover,
    //         width: 50,
    //         height: 50,
    //       ),
    //       title: Text(restaurant[i].name),
    //       subtitle: Text(restaurant[i].distance.toString()),
    //     ),
    //   );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final restaurant =
        Provider.of<Restaurants>(context).searchRestaurants(query);

    if (restaurant.isEmpty) {
      return const Text("No results found");
    } else {
      return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: restaurant.length,
        itemBuilder: (context, i) => ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              restaurant[i].img,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
          ),
          title: Text(
            restaurant[i].name,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(restaurant[i].catchPhrase.toString()),
        ),
      );
    }
  }
}
