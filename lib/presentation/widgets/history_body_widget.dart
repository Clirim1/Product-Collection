import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryBodyWidget extends StatelessWidget {
  const HistoryBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        "label": "Label",
        "title": "Title",
        "descriptions": ["Description", "Description"],
        "attachments": [1, 2, 3],
      },
      {
        "label": "Label",
        "title": "Title",
        "descriptions": ["Description", "Description"],
        "attachments": [1, 2, 3],
      },
    ];

    return Container(
      width: double.infinity,
      color: const Color(0xFF0E171B),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final bool isLast = index == items.length - 1;

          return Stack(
            children: [
              Positioned(
                left: 11,
                top: 12,
                bottom: isLast ? 12 : 0,
                child: Container(width: 2, color: const Color(0xFFE5AF3C)),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      if (!isLast) ...[
                        const SizedBox(height: 16),
                        _Diamond(),
                        const SizedBox(height: 4),
                        _Diamond(),
                      ],
                    ],
                  ),
                  const SizedBox(width: 20),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0E171B),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["label"] ?? "",
                            style: GoogleFonts.lato(
                              fontSize: 13,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item["title"] ?? "",
                            style: GoogleFonts.lora(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...((item["descriptions"] as List<dynamic>).map((d) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: Text(
                                d.toString(),
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  color: Colors.white70,
                                ),
                              ),
                            );
                          }).toList()),
                          const SizedBox(height: 12),

                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0C1519),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.attach_file,
                                      size: 16,
                                      color: Colors.white70,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      "Attachments",
                                      style: GoogleFonts.lato(
                                        fontSize: 14,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children:
                                      (item["attachments"] as List<dynamic>)
                                          .map(
                                            (_) => Container(
                                              width: 60,
                                              height: 60,
                                              margin: const EdgeInsets.only(
                                                right: 8,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.grey[400],
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _Diamond extends StatelessWidget {
  const _Diamond();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.7854,
      child: Container(width: 10, height: 10, color: const Color(0xFFE5AF3C)),
    );
  }
}
