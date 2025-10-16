import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pixelfield_flutter/presentation/widgets/background_container.dart';
import 'package:pixelfield_flutter/presentation/widgets/details_tab_widget.dart';
import 'package:pixelfield_flutter/presentation/widgets/history_body_widget.dart';
import 'package:pixelfield_flutter/presentation/widgets/test_notes_widget.dart';
import '../../data/models/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({required this.product, super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedIndex = 0;

  final List<String> tabs = const ["Details", "Tasting notes", "History"];
  final List<Widget> tabWidgets = [
    DetailsTabWidget(),
    TestNotesWidget(),
    HistoryBodyWidget(),
  ];

  void _onTabSelected(int index) {
    setState(() => selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      body: BackgroundContainer(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildAppBar(context),
                const SizedBox(height: 20),
                _buildAppBarRibbon(),
                const SizedBox(height: 40),
                Image.network(product.image, height: 330),
                const SizedBox(height: 30),
                _buildDetailsContainer(product),
                _buildAddButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      children: [
        Container(
          color: const Color(0XFF0B1519),
          padding: const EdgeInsets.all(5),
          child: Text(
            "Genesis Collection",
            style: GoogleFonts.lato(fontSize: 12),
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () => context.pop(),
          child: Container(
            padding: const EdgeInsets.all(8),
            color: const Color(0XFF0B1519),
            child: const Icon(Icons.clear, size: 24),
          ),
        ),
      ],
    );
  }

  Widget _buildAppBarRibbon() {
    return Container(
      color: const Color(0XFF0B1519),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Row(
        children: [
          Image.asset("assets/images/details_icon_widget.png", width: 24),
          const SizedBox(width: 10),
          Text(
            "Genuine Bottle (Unopened)",
            style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          const Icon(Icons.expand_more, color: Color(0XFFFEB903)),
        ],
      ),
    );
  }

  Widget _buildDetailsContainer(Product product) {
    return Container(
      color: const Color(0XFF122329),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductInfo(product),
          _buildTabSelector(),
          tabWidgets[selectedIndex],
        ],
      ),
    );
  }

  Widget _buildProductInfo(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bottle ${product.quantity}",
          style: GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${product.name}  ',
                style: GoogleFonts.ebGaramond(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: '18 Year old',
                style: GoogleFonts.ebGaramond(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: const Color(0XFFD49A00),
                ),
              ),
            ],
          ),
        ),
        Text(
          '#${product.id}',
          style: const TextStyle(fontSize: 32, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildTabSelector() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 20),
      padding: const EdgeInsets.all(2),
      height: 30,
      decoration: BoxDecoration(
        color: const Color(0XFF0E1C21),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = selectedIndex == index;
          return Expanded(
            child: InkWell(
              onTap: () => _onTabSelected(index),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0XFFD49A00)
                      : const Color(0XFF0E1C21),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    color: isSelected ? Colors.black : const Color(0XFF889194),
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildAddButton() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 20),
      width: 200,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0XFFD49A00),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, color: Colors.black),
          SizedBox(width: 6),
          Text(
            'Add to my collection',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
