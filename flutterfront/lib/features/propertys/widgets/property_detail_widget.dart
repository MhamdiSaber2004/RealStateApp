import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterfront/features/propertys/data/property_by_id_data.dart';
import 'package:flutterfront/models/PropertyModel.dart';
import 'package:gap/gap.dart';
import 'package:flutterfront/core/constants/app_colors.dart';

class PropertyDetailPage extends StatelessWidget {
  final Property property = propertyById;

  PropertyDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ====== Images Slider ======
          Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                ),
                items: property.images.map((image) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                }).toList(),
              ),
              // ====== Status Badge ======
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    property.status.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ====== Property Info ======
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title & Type
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        property.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.text,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(8),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 18,
                      color: Colors.grey[600],
                    ),
                    const Gap(4),
                    Text(
                      property.city ?? "Unknown location",
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const Gap(12),

                // Price
                Text(
                  "\$${property.price.toStringAsFixed(0)}",
                  style: TextStyle(color: AppColors.secondary, fontSize: 24),
                ),

                const Divider(height: 30),

                // Extra Info (Area - Rooms - Views)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _infoTile(
                      Icons.square_foot,
                      "Area",
                      "${property.area?.toStringAsFixed(0) ?? '-'} m²",
                    ),
                    _infoTile(
                      Icons.meeting_room,
                      "Rooms",
                      "${property.rooms ?? '-'}",
                    ),
                    _infoTile(
                      Icons.remove_red_eye,
                      "Views",
                      "${property.views}",
                    ),
                  ],
                ),

                const Divider(height: 30),

                // Description
                const Text(
                  "Description",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Gap(8),
                Text(
                  property.description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),

                const Gap(25),

                // ====== Chat Button ======
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.chat_bubble_outline),
                    label: const Text("Chat with Agent"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[600],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.grey[700]),
        const Gap(4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }
}
