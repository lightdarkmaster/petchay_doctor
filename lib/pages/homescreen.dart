import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //backgroundColor: Theme.of(context).colorScheme.background,
      //body: Container(
      //color: const Color.fromARGB(255, 255, 255, 255),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Colors.white,
                elevation: 10,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Introduction',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/plant1.gif', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Introducing "Petchay Doctor," your AI app companion designed to provide comprehensive assistance and guidance for all your gardening needs. With its advanced algorithms and vast knowledge base, Petchay Doctor offers personalized recommendations, tips, and solutions tailored to help you cultivate healthy and thriving bok choy plants. Say hello to your gardening partner, simplifying the journey to green thumbs and abundant harvests.',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Card(
                color: Colors.white,
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/Aimage.gif', // Path to local image asset
                      height: 280,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Utilizing AI revolutionizes industries by harnessing advanced algorithms to analyze vast datasets, predict outcomes, and automate processes, leading to enhanced efficiency and innovation. From personalized recommendations in e-commerce to predictive maintenance in manufacturing, AI empowers businesses to make data-driven decisions, optimize operations, and deliver superior customer experiences. Embracing AI opens doors to transformative possibilities, driving growth, competitiveness, and sustainable development across various sectors.',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/bot.gif', // Path to local image asset
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Utilize Image Recognition Technology to make a vast changes in the field of Agriculture, specifically in the field of BokChoy Farming',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/botanist.gif', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'AI Botanist',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Add more cards here as needed
            ],
          ),
        ),
      ),
    );
  }
}
