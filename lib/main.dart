import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    int columns = 3;

  
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 800) {
      columns = 5;
    } else if (screenWidth > 600) {
      columns = 4;
    } else if (screenWidth > 400) {
      columns = 3;
    }else if (screenWidth > 200) {

    }

    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(child: child!, breakpoints: [
         const Breakpoint(start: 0, end: 450, name: MOBILE),
           const Breakpoint(start: 451, end: 800, name: TABLET),
           const Breakpoint(start: 801, end: 1920, name: DESKTOP),
           const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
      ),
     
    
  
      home: Scaffold(
        body: 
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: constraints.maxWidth * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            size: constraints.maxWidth * 0.15,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Flutter McFlutter',
                                  style: TextStyle(fontSize: constraints.maxWidth * 0.05),
                                ),
                                Text(
                                  'Experience App Developer',
                                  style: TextStyle(fontSize: constraints.maxWidth * 0.035),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '123 Main Street',
                            style: TextStyle(fontSize: constraints.maxWidth * 0.04),
                          ),
                          Text(
                            '(415) 555-0198',
                            style: TextStyle(fontSize: constraints.maxWidth * 0.04),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.man,
                            size: constraints.maxWidth * 0.1,
                          ),
                          Icon(
                            Icons.punch_clock,
                            size: constraints.maxWidth * 0.1,
                          ),
                          Icon(
                            Icons.tablet,
                            size: constraints.maxWidth * 0.1,
                          ),
                          Icon(
                            Icons.phone_android,
                            size: constraints.maxWidth * 0.1,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                     
                      Expanded(
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: columns,
                          ),
                          itemCount: 10, 
                          itemBuilder: (context, index) {
                           
                            return Container(
                              color: Colors.primaries[index % Colors.primaries.length],
                              height: 50,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
    ));
  } }