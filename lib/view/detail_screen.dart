import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  var place;

   DetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(place.name),
              background: Image.network(
                place.coverImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    place.location,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text('${place.averageRating}/5'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Details',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Duration: ${formatDuration(place.duration)}',
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Distance: ${formatDistance(place.distance)}',
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Price: \$${place.price}',
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    place.description ?? 'No description available',
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Images',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: place.images.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.network(place.images[index].path),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String formatDuration(int duration) {
    if (duration > 999) {
      double hours = duration / 60;
      return '${hours.toStringAsFixed(1)}h';
    } else {
      return '${duration}m';
    }
  }

  String formatDistance(int distance) {
    if (distance > 999) {
      double kilometers = distance / 1000;
      return '${kilometers.toStringAsFixed(1)}km';
    } else {
      return '${distance}m';
    }
  }
}
