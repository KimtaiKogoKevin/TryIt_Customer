import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  SearchInput({Key? key}) : super(key: key);
  final tagLists = ['Home&Decor', 'Office', 'Kitchen', 'Laundry'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          child: Column(
        children: [
          Row(children: [
            Flexible(
              flex: 1,
              child: TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                    prefixIcon: Container(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          'assets/icons/search.png',
                          width: 20,
                        )),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.grey)
                        // borderSide: BorderSide.none
                        ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                    ),
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    )),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 25),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset('assets/icons/filter.png', width: 20),
            )
          ]),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Row(
                children: tagLists
                    .map((e) => Container(
                  margin: const EdgeInsets.only(top:10,right:10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:Theme.of(context).colorScheme.primary

                  ),
                          child: Text(e, style: const TextStyle(color: Colors.white)),
                        ))
                    .toList()),
          )
        ],
      )),
    );
  }
}
