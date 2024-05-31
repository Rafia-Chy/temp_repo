import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/bloc/places_cubit.dart';
import 'package:travel_app/bloc/places_state.dart';

import 'detail_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color(0xff1E92A4),
        title: const Text(
          'Explore routes',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xffFFFFFF)),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
      ),
      body: BlocBuilder<PlacesCubit, PlacesState>(
        builder: (context, state) {
          if (state is PlacesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PlacesLoaded) {
            return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(child: buildRoutesNearByTitle()),
              ],
              body: ListView(
                children: [
                  buildRouteNearby(state),
                  if (state.displayPlaces.length < (state.places.data?.nearby!.length ?? 0)) ...[
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<PlacesCubit>().loadMorePlaces();
                        },
                        child: const Text('Load More'),
                      ),
                    ),
                  ],
                  buildFavToursTitle(),
                  buildFavTours(state),
                ],
              ),
            );
          } else if (state is PlacesError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          return Container();
        },
      ),
    );
  }

  Widget buildRoutesNearByTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              text: 'Routes ',
              style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
              children: <TextSpan>[
                TextSpan(
                  text: 'nearby',
                  style: TextStyle(fontSize: 18, color: Color(0xff1E92A4), fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRouteNearby(PlacesLoaded state) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: state.displayPlaces.length,
      itemBuilder: (context, index) {
        final location = state.displayPlaces[index];
        return Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen(place: location)),
              );
            },
            child: Container(
              height: 124,
              width: 370,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Color(0xffF6F6F6), blurRadius: 20.0, spreadRadius: 0.0, offset: Offset(0.0, 0.6)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48),
                        child: Image.network(location.coverImage.toString(), fit: BoxFit.cover),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12, top: 14),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(
                            location.name.toString(),
                            style: const TextStyle(
                              color: Color(0xff333333),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/icon.png',
                                      height: 24,
                                      width: 24,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      location.location.toString(),
                                      style: const TextStyle(
                                        color: Color(0xff878787),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Color(0xffFFC700),
                                      size: 12,
                                    ),
                                    Text(
                                      '${location.averageRating}/5',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xffacacac)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Divider(
                              color: Color(0xffBABABA),
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/clock.png',
                                    height: 16,
                                    width: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    formatDuration(location.duration!),
                                    style: const TextStyle(
                                        fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff878787)),
                                  ),
                                  const VerticalDivider(
                                    thickness: 0.8,
                                    width: 20,
                                    color: Color(0xff333333),
                                  ),
                                  Image.asset(
                                    'assets/images/empty-wallet.png',
                                    height: 16,
                                    width: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '\$${location.price.toString()}',
                                    style: const TextStyle(
                                        fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff878787)),
                                  ),
                                  const VerticalDivider(
                                    thickness: 0.8,
                                    width: 20,
                                    color: Color(0xff333333),
                                  ),
                                  Image.asset(
                                    'assets/images/arrow-swap-horizontal.png',
                                    height: 16,
                                    width: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    formatDistance(location.distance!),
                                    style: const TextStyle(
                                        fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff878787)),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildFavToursTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              text: 'Favourite ',
              style:
              TextStyle(fontSize: 18, fontFamily: 'Roboto', color: Color(0xff1E92A4), fontWeight: FontWeight.w600),
              children: <TextSpan>[
                TextSpan(
                  text: 'Tours',
                  style:
                  TextStyle(fontSize: 18, fontFamily: 'Roboto', color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ],
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

  Widget buildFavTours(PlacesLoaded state) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: state.places.data?.popular?.length,
      itemBuilder: (context, index) {
        final location = state.places.data?.popular![index];
        return Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen(place: location)),
              );
            },
            child: Container(
              height: 124,
              width: 378,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Color(0xffF6F6F6), blurRadius: 20.0, spreadRadius: 0.0, offset: Offset(0.0, 0.4)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48),
                        child: Image.network(location!.coverImage.toString(), fit: BoxFit.cover),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12, top: 14),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(
                            location.name.toString(),
                            style: const TextStyle(
                              color: Color(0xff333333),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/icon.png',
                                      height: 24,
                                      width: 24,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      location.location.toString(),
                                      style: const TextStyle(
                                        color: Color(0xff878787),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Color(0xffFFC700),
                                      size: 12,
                                    ),
                                    Text(
                                      '${location.averageRating}/5',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xffacacac)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Divider(
                              color: Color(0xffBABABA),
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/clock.png',
                                    height: 16,
                                    width: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    formatDuration(location.duration!),
                                    style: const TextStyle(
                                        fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff878787)),
                                  ),
                                  const VerticalDivider(
                                    thickness: 0.8,
                                    width: 20,
                                    color: Color(0xff333333),
                                  ),
                                  Image.asset(
                                    'assets/images/empty-wallet.png',
                                    height: 16,
                                    width: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '\$${location.price.toString()}',
                                    style: const TextStyle(
                                        fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff878787)),
                                  ),
                                  const VerticalDivider(
                                    thickness: 0.8,
                                    width: 20,
                                    color: Color(0xff333333),
                                  ),
                                  Image.asset(
                                    'assets/images/arrow-swap-horizontal.png',
                                    height: 16,
                                    width: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    formatDistance(location.distance!),
                                    style: const TextStyle(
                                        fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff878787)),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
