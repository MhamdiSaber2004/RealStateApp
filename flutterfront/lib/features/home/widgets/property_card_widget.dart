import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterfront/core/constants/app_colors.dart';
import 'package:flutterfront/features/propertys/views/consolter_property_view.dart';
import 'package:flutterfront/models/PropertyModel.dart';
import 'package:gap/gap.dart';

class PropertyCardWidget extends StatefulWidget {
  final Property property;

  const PropertyCardWidget({super.key, required this.property});

  @override
  State<PropertyCardWidget> createState() => _PropertyCardWidgetState();
}

class _PropertyCardWidgetState extends State<PropertyCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shadowColor: Colors.black45,
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 140,
                        autoPlay: true,
                        viewportFraction: 1,
                        enableInfiniteScroll: true,
                      ),
                      items: widget.property.images.map((image) {
                        return Image.network(
                          image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      }).toList(),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        widget.property.status.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.property.title,
                      style: TextStyle(
                        color: AppColors.text,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(5),
              Text(
                "\$${widget.property.price}",
                style: TextStyle(color: AppColors.secondary, fontSize: 20),
              ),
              Gap(10),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green[600],
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chat_bubble,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  Gap(10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConsolterPropertypage(
                              propertyName: widget.property.title,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Details",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
