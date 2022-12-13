import 'package:flutter/material.dart';
import 'package:real_time_track_package/real_time_track_package.dart';

class CountryPicker extends StatefulWidget {
  const CountryPicker({Key? key}) : super(key: key);

  static Future<Country?> show(BuildContext context) async {
    return await showModalBottomSheet<Country?>(
      context: context,
      elevation: 0,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimension.d4),
      ),
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: const CountryPicker(),
        );
      },
    );
  }

  static Widget view({required Country country, required VoidCallback onTap}) {
    return _CountyView(country: country, onTap: onTap);
  }

  @override
  State<CountryPicker> createState() => CountryPickerState();
}

class CountryPickerState extends State<CountryPicker> {
  //
  final TextEditingController _searchText = TextEditingController();

  bool _isSearching = false;

  List<Country> _countries = [];
  List<Country> _searchableCountries = [];

  void _onChangeHandler(String? value) {
    if (value != null && value.isNotEmpty) {
      _isSearching = true;
      _searchableCountries = _countries.where((c) {
        return (c.name.toLowerCase()).contains(value.toLowerCase());
      }).toList();
    } else {
      _isSearching = false;
      _searchableCountries.clear();
    }
    _rebuild();
  }

  int get totalCountries {
    return _isSearching ? _searchableCountries.length : _countries.length;
  }

  Country getCountryByIndex(int index) {
    return _isSearching ? _searchableCountries[index] : _countries[index];
  }

  @override
  void initState() {
    super.initState();
    _loadCountries();
  }

  Future<void> _loadCountries() async {
    _countries = List<Country>.from(countries.map((x) => Country.fromMap(x)));
    _rebuild();
  }

  void _rebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.8,
      width: size.width,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBoxH10(),
            const SheetHeaderLine(),
            const SizedBoxH20(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: Dimension.d4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.d4),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 5,
                  )
                ],
              ),
              child: RttTextField(
                controller: _searchText,
                hintText: 'Search Country',
                onChanged: _onChangeHandler,
                prefixIcon: const Icon(Icons.search, size: 30),
              ),
            ),
            const SizedBoxH10(),
            _buildCountryListing(),
          ],
        ),
      ),
    );
  }

  Widget _buildCountryListing() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: ListView.builder(
        itemCount: totalCountries,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          Country country = getCountryByIndex(index);
          return ListTile(
            dense: true,
            leading: Image.asset(
              country.image,
              height: 30,
              width: 50,
              package: RealTimeTrack.name,
              filterQuality: FilterQuality.high,
            ),
            title: Text(
              '${country.name} (${country.code})',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.titleMedium,
            ),
            trailing: Text(
              country.dialCode,
              style: textTheme.titleMedium,
            ),
            onTap: () {
              Navigator.pop(context, country);
            },
          );
        },
      ),
    );
  }
}

class _CountyView extends StatelessWidget {
  final Country country;
  final VoidCallback onTap;

  const _CountyView({required this.country, required this.onTap});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            country.image,
            height: 20,
            width: 40,
            package: RealTimeTrack.name,
            filterQuality: FilterQuality.high,
          ),
          const SizedBoxW10(),
          Text(
            country.dialCode,
            style: textTheme.titleLarge?.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
