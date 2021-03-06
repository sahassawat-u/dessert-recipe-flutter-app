import 'package:dessert_app/models/dessert.dart';
import 'package:dessert_app/pages/timer_page.dart';
import 'package:flutter/material.dart';

import '../widgets/ingredient.dart';

class RecipePage extends StatelessWidget {
  RecipePage({required this.dessert});
  final Dessert dessert;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 120,
                  margin: EdgeInsets.only(top: 430),
                  color: Colors.grey[100],
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 20,
                    top: 40,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        // color: Colors.red,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TimerPage(
                                  prepTime: dessert.prepTime,
                                  cookTime: dessert.cookTime,
                                  color: dessert.color,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: dessert.color),
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.access_alarms,
                                  color: dessert.color,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  (dessert.prepTime + dessert.cookTime)
                                          .toString() +
                                      " mins",
                                  style: TextStyle(
                                    color: dessert.color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Icon(
                              Icons.person_outlined,
                              color: Colors.grey.shade700,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              dessert.serving,
                              style: TextStyle(
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Icon(
                              Icons.emoji_objects_outlined,
                              color: Colors.grey.shade700,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              dessert.lvl,
                              style: TextStyle(
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: dessert.color,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: 30,
                          top: 70,
                          right: 40,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back_ios),
                              color: Colors.grey.shade700,
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                      ),
                      Container(
                        height: 240,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(dessert.imgUrl),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 40),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          dessert.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 40),
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        "Ingredients",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                        top: 18,
                        bottom: 18,
                        left: 20,
                      ),
                      height: 60.0,
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: dessert.ingredients.length,
                        itemBuilder: (BuildContext context, int index) =>
                            IngredientWidget(
                          ingredient: dessert.ingredients[index],
                          theme: dessert.color,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 40),
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          const EdgeInsets.only(left: 40, top: 20, right: 40),
                      child: Text(
                        dessert.step,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // print();
}
