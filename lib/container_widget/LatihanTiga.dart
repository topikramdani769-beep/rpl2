import 'package:flutter/material.dart';

class Persija extends StatelessWidget {
  const Persija({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 233, 235, 238),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 600,
              height: 100,
              color: const Color.fromARGB(255, 127, 125, 125),
              child: const Center(
                child: Text(
                  "Persija",
                  style: TextStyle(
                    color: Color.fromARGB(255, 4, 4, 4),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 250,
                  height: 250,
                  color: const Color.fromARGB(255, 127, 125, 125),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 175,
                        height: 175,
                        color: const Color.fromARGB(255, 233, 4, 4),
                        child:const Center(
                          child:Text(
                            "Logo",
                            style: TextStyle(
                              color: Color.fromARGB(255, 251, 250, 250),
                              fontSize: 20,
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 250,
                  height: 250,
                  color: const Color.fromARGB(255, 127, 125, 125),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 175,
                        height: 175,
                        color: const Color.fromARGB(255, 233, 4, 4),
                        child:const Center(
                          child:Text(
                            "Logo",
                            style: TextStyle(
                              color: Color.fromARGB(255, 254, 254, 254),
                              fontSize: 20,
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              width: 540,
              height: 125,
              color: const Color.fromARGB(255, 127, 125, 125),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 510,
                    height: 80,
                    color: const Color.fromARGB(255, 233, 4, 4),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      style: TextStyle(
                        color: Color.fromARGB(255, 4, 4, 4),
                        fontSize: 16,
                      ),
                    )
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: 540,
              height: 125,
              color: const Color.fromARGB(255, 127, 125, 125),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 510,
                    height: 80,
                    color: const Color.fromARGB(255, 233, 4, 4),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      style: TextStyle(
                        color: Color.fromARGB(255, 4, 4, 4),
                        fontSize: 16,
                      ),
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}