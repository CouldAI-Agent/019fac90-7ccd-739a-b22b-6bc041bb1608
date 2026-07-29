import 'package:flutter/material.dart';

void main() {
  runApp(const JuiceShopApp());
}

class JuiceShopApp extends StatelessWidget {
  const JuiceShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'عصائر طازجة',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        fontFamily: 'Cairo', // Assuming a common Arabic font, falls back gracefully
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const JuiceLandingPage(),
      },
    );
  }
}

class JuiceLandingPage extends StatelessWidget {
  const JuiceLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('عصائر طازجة', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hero Section
            Container(
              padding: const EdgeInsets.all(40),
              color: Colors.orange.shade100,
              child: Column(
                children: [
                  const Icon(Icons.local_drink, size: 100, color: Colors.orange),
                  const SizedBox(height: 20),
                  const Text(
                    'أفضل العصائر الطبيعية',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'طعم الانتعاش الحقيقي في كل رشفة',
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    child: const Text('اطلب الآن'),
                  ),
                ],
              ),
            ),
            // Menu Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text(
                    'قائمتنا المميزة',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      int crossAxisCount = constraints.maxWidth > 800 ? 4 : (constraints.maxWidth > 500 ? 2 : 1);
                      return GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.8,
                        children: const [
                          JuiceCard(
                            name: 'عصير البرتقال',
                            description: 'برتقال طازج 100%',
                            price: '15 ريال',
                            icon: Icons.circle,
                            color: Colors.orange,
                          ),
                          JuiceCard(
                            name: 'عصير الفراولة',
                            description: 'فراولة طبيعية مع الثلج',
                            price: '18 ريال',
                            icon: Icons.favorite,
                            color: Colors.red,
                          ),
                          JuiceCard(
                            name: 'عصير المانجو',
                            description: 'مانجو استوائية منعشة',
                            price: '20 ريال',
                            icon: Icons.wb_sunny,
                            color: Colors.amber,
                          ),
                          JuiceCard(
                            name: 'عصير الليمون بالنعناع',
                            description: 'انتعاش لا مثيل له',
                            price: '12 ريال',
                            icon: Icons.eco,
                            color: Colors.green,
                          ),
                        ],
                      );
                    }
                  ),
                ],
              ),
            ),
            // Footer Section
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.orange.shade800,
              child: const Column(
                children: [
                  Text(
                    'تواصل معنا',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'الهاتف: 0500000000\nالعنوان: شارع الانتعاش، المدينة',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                    textAlign: TextAlign.center,
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

class JuiceCard extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final IconData icon;
  final Color color;

  const JuiceCard({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: color),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Text(
              price,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('إضافة'),
            ),
          ],
        ),
      ),
    );
  }
}
