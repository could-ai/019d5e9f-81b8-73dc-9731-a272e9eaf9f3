import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Scaffold(
      drawer: isMobile ? _buildDrawer() : null,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(isMobile),
          SliverToBoxAdapter(
            child: Column(
              children: [
                _buildHeroSection(context),
                const SizedBox(height: 80),
                _buildSectionTitle('SHOP BY CATEGORY'),
                const SizedBox(height: 40),
                _buildCategories(context, isMobile),
                const SizedBox(height: 80),
                _buildSectionTitle('NEW ARRIVALS'),
                const SizedBox(height: 40),
                _buildProductGrid(context, screenWidth),
                const SizedBox(height: 100),
                _buildFooter(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            child: Center(
              child: Text(
                'VOGUE',
                style: TextStyle(color: Colors.white, fontSize: 24, letterSpacing: 4, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(title: const Text('Home'), onTap: () {}),
          ListTile(title: const Text('Shop'), onTap: () {}),
          ListTile(title: const Text('Collections'), onTap: () {}),
          ListTile(title: const Text('About Us'), onTap: () {}),
        ],
      ),
    );
  }

  SliverAppBar _buildAppBar(bool isMobile) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      title: const Text(
        'VOGUE',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          letterSpacing: 4,
          fontSize: 24,
        ),
      ),
      centerTitle: isMobile,
      actions: isMobile
          ? [
              IconButton(icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black), onPressed: () {}),
              const SizedBox(width: 10),
            ]
          : [
              TextButton(onPressed: () {}, child: const Text('Home', style: TextStyle(color: Colors.black87))),
              const SizedBox(width: 10),
              TextButton(onPressed: () {}, child: const Text('Shop', style: TextStyle(color: Colors.black87))),
              const SizedBox(width: 10),
              TextButton(onPressed: () {}, child: const Text('Collections', style: TextStyle(color: Colors.black87))),
              const SizedBox(width: 20),
              IconButton(icon: const Icon(Icons.search, color: Colors.black), onPressed: () {}),
              IconButton(icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black), onPressed: () {}),
              const SizedBox(width: 40),
            ],
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1490481651871-ab68de25d43d?q=80&w=2070&auto=format&fit=crop'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.black.withOpacity(0.35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'SUMMER COLLECTION 2024',
              style: TextStyle(color: Colors.white, fontSize: 16, letterSpacing: 4, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Discover Your\nTrue Style',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                elevation: 0,
              ),
              child: const Text(
                'SHOP NOW',
                style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 60,
          height: 3,
          color: Colors.black,
        ),
      ],
    );
  }

  Widget _buildCategories(BuildContext context, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _categoryCard('Women', 'https://images.unsplash.com/photo-1483985988355-763728e1935b?q=80&w=800&auto=format&fit=crop', isMobile),
          SizedBox(width: isMobile ? 0 : 20, height: isMobile ? 20 : 0),
          _categoryCard('Men', 'https://images.unsplash.com/photo-1617137968427-85924c800a22?q=80&w=800&auto=format&fit=crop', isMobile),
          SizedBox(width: isMobile ? 0 : 20, height: isMobile ? 20 : 0),
          _categoryCard('Accessories', 'https://images.unsplash.com/photo-1523206489230-c012c64b2b48?q=80&w=800&auto=format&fit=crop', isMobile),
        ],
      ),
    );
  }

  Widget _categoryCard(String title, String imageUrl, bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 350,
      height: 450,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.black.withOpacity(0.2),
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(30),
        child: Container(
          width: double.infinity,
          color: Colors.white.withOpacity(0.9),
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context, double screenWidth) {
    final products = [
      {'name': 'Classic White Tee', 'price': '\$29.99', 'image': 'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=600&auto=format&fit=crop'},
      {'name': 'Denim Jacket', 'price': '\$89.99', 'image': 'https://images.unsplash.com/photo-1550639525-c97d455acf70?q=80&w=600&auto=format&fit=crop'},
      {'name': 'Summer Floral Dress', 'price': '\$59.99', 'image': 'https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?q=80&w=600&auto=format&fit=crop'},
      {'name': 'Premium Leather Bag', 'price': '\$129.99', 'image': 'https://images.unsplash.com/photo-1584273143981-41c073dfe8f8?q=80&w=600&auto=format&fit=crop'},
      {'name': 'Casual Sneakers', 'price': '\$79.99', 'image': 'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?q=80&w=600&auto=format&fit=crop'},
      {'name': 'Elegant Watch', 'price': '\$199.99', 'image': 'https://images.unsplash.com/photo-1524592094714-0f0654e20314?q=80&w=600&auto=format&fit=crop'},
      {'name': 'Woolen Scarf', 'price': '\$34.99', 'image': 'https://images.unsplash.com/photo-1520903920243-00d872a2d1c9?q=80&w=600&auto=format&fit=crop'},
      {'name': 'Sunglasses', 'price': '\$49.99', 'image': 'https://images.unsplash.com/photo-1511499767150-a48a237f0083?q=80&w=600&auto=format&fit=crop'},
    ];

    int crossAxisCount = screenWidth > 1100 ? 4 : (screenWidth > 700 ? 3 : (screenWidth > 500 ? 2 : 1));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: 0.65,
          crossAxisSpacing: 30,
          mainAxisSpacing: 40,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return _productCard(
            products[index]['name']!,
            products[index]['price']!,
            products[index]['image']!,
          );
        },
      ),
    );
  }

  Widget _productCard(String name, String price, String imageUrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.5),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Text(
          price,
          style: TextStyle(fontSize: 15, color: Colors.grey[700], fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Column(
        children: [
          const Text(
            'VOGUE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: 6,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Subscribe to our newsletter for updates and exclusive offers.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _socialIcon(Icons.facebook),
              const SizedBox(width: 20),
              _socialIcon(Icons.camera_alt), // Instagram placeholder
              const SizedBox(width: 20),
              _socialIcon(Icons.alternate_email), // Twitter placeholder
            ],
          ),
          const SizedBox(height: 60),
          const Divider(color: Colors.white24),
          const SizedBox(height: 20),
          const Text(
            '© 2024 Vogue Fashion. All rights reserved.',
            style: TextStyle(color: Colors.white38, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white38),
      ),
      child: Icon(icon, color: Colors.white, size: 24),
    );
  }
}
