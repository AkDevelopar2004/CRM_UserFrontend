import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String duration;
  final String category;
  final String originalPrice;
  final String discountedPrice;
  final String imageAsset; // For local assets

  const CourseCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.category,
    required this.originalPrice,
    required this.discountedPrice,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 180,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2D3748), // Dark blue-gray
            Color(0xFF4A5568), // Medium blue-gray
            Color(0xFF667EEA), // Blue
            Color(0xFF764BA2), // Purple
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top section with logo and image
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left side - Logo and title
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Flutter logo with text
                      Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: const BoxDecoration(
                              color: Color(0xFF02B0D9),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Flutter',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Subtitle
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                // Right side - 3D illustration
                Container(
                  width: 70,
                  height: 50,
                  child: Image.asset(
                    imageAsset,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF667EEA),
                              Color(0xFF764BA2),
                            ],
                          ),
                        ),
                        child: const Icon(
                          Icons.phone_android,
                          color: Colors.white,
                          size: 24,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            
            const Spacer(),
            
            // Bottom section
            const Text(
              'Topic of video',
              style: TextStyle(
                color: Color(0xFFB0B8C1),
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 4),
            
            // Duration and category
            Row(
              children: [
                Text(
                  duration,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  width: 2,
                  height: 2,
                  decoration: const BoxDecoration(
                    color: Color(0xFFB0B8C1),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  category,
                  style: const TextStyle(
                    color: Color(0xFFB0B8C1),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            
            // Price section
            Row(
              children: [
                Text(
                  originalPrice,
                  style: const TextStyle(
                    color: Color(0xFFB0B8C1),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  discountedPrice,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

