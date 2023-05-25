enum TravelMode { driving, bicycling, transit, walking }

class GoogleMapUtils {
  const GoogleMapUtils._();

  static const String googleMapUrl =
      'https://www.google.com/maps/search/?api=1&query';

  static String getGoogleMapDirectionsUrl({
    required Coordinates destination,
    String? destinationTitle,
    Coordinates? origin,
    String? originTitle,
    List<Coordinates> waypoints = const [],
    Map<String, String> extraParams = const {},
    TravelMode travelMode = TravelMode.driving,
  }) {
    return _buildUrl(
      url: 'https://www.google.com/maps/dir/',
      queryParams: {
        'api': '1',
        'destination': '${destination.latitude},${destination.longitude}',
        'origin': _nullOrValue(
          origin,
          '${origin?.latitude},${origin?.longitude}',
        ),
        'dir_action': 'navigate',
        'waypoints': waypoints
            .map((coords) => '${coords.latitude},${coords.longitude}')
            .join('|'),
        'travelmode': travelMode.name,
        ...(extraParams),
      },
    );
  }

  static String getAppleMapDirectionsUrl({
    required Coordinates destination,
    Map<String, String> extraParams = const {},
  }) {
    return _buildUrl(
      url: 'http://maps.apple.com/maps',
      queryParams: {
        'daddr': '${destination.latitude},${destination.longitude}',
        ...(extraParams),
      },
    );
  }

  static String? _nullOrValue(dynamic nullable, String value) {
    if (nullable == null) return null;
    return value;
  }

  static String _buildUrl({
    required String url,
    required Map<String, String?> queryParams,
  }) {
    return queryParams.entries.fold('$url?', (dynamic previousValue, element) {
      if (element.value == null || element.value == '') {
        return previousValue;
      }
      return '$previousValue&${element.key}=${element.value}';
    }).replaceFirst('&', '');
  }
}

class Coordinates {
  final double latitude;
  final double longitude;

  const Coordinates({required this.latitude, required this.longitude});

  @override
  String toString() {
    return 'Coordinates: $latitude $longitude';
  }
}
