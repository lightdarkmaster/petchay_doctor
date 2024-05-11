import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key});

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
                elevation: 10,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/aboutus.gif', // Path to local image asset
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Hello, We are BSIT Students at Leyte Normal Universities (LNU), and currently working in our Mobile Application entitled: BokChoy Doctor.',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Card(
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/aboutus3.gif', // Path to local image asset
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Our group is committed to collaborative teamwork, fostering creativity, and achieving excellence in every project we undertake. With a diverse range of skills and perspectives, we aim to tackle challenges innovatively and deliver impactful solutions. Together, we strive to uphold professionalism, communication, and mutual support to achieve our shared goals efficiently.',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/aboutus2.png', // Path to local image asset
                      height: 320,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Introducing Christian Barbosa, our talented programmer behind the development of this AI Mobile Application. With his expertise and dedication, Christian has brought innovation and functionality to our project, ensuring a seamless user experience and robust performance. We are proud to have him on our team, driving excellence in every aspect of the applications development.Utilize Image Recognition Technology to make a vast changes in the field of Agriculture, specifically in the field of BokChoy Farming',
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
