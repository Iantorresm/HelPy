import 'package:flutter/material.dart';

class Service {
  final String title;
  final String description;
  final String price;
  final List<String> images;

  Service({
    required this.title,
    required this.description,
    required this.price,
    required this.images,
  });
}

class ServiceCard extends StatefulWidget {
  final Service service;

  const ServiceCard({super.key, required this.service});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isExpanded = false;

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: isExpanded ? 300 : 150,
      height: isExpanded ? 200 : 150,
      decoration: BoxDecoration(
        color: Colors.lightBlue[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 25.5), //agrega opacidad
            blurRadius: 8,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: toggleExpanded,
        child: isExpanded ? _buildExpandedView() : _buildReducedView(),
      ),
    );
  }

  Widget _buildReducedView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.service.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          widget.service.description.length > 30
              ? "${widget.service.description.substring(0, 30)}..."
              : widget.service.description,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Text(
          "Precio: ${widget.service.price}",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildExpandedView() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.service.title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.service.description,
                  style: const TextStyle(fontSize: 14),
                ),
                const Spacer(),
                Text(
                  "Precio: ${widget.service.price}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.service.images
                .map((imageUrl) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(imageUrl,
                            fit: BoxFit.cover, height: 50, width: 50),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}


//ejemplo de uso
/*
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: ServiceCard(
          service: Service(
            title: "Reparación",
            description: "Inspección minuciosa para identificar daños como pinchazos, cortes, fugas, etc.",
            price: "40.000 Gs",
            images: [
              "https://via.placeholder.com/50",
              "https://via.placeholder.com/50",
            ],
          ),
        ),
      ),
    ),
  ));
}

 */