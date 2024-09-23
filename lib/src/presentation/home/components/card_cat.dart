import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge_pragma_msolimano/src/domain/models/cat.dart';
import 'package:challenge_pragma_msolimano/src/presentation/home/components/cat_details.dart';
import 'package:challenge_pragma_msolimano/src/presentation/shared/responsive.dart';
import 'package:flutter/material.dart';

class CardCat extends StatelessWidget {
  Cat catInfo;

  CardCat(this.catInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final double widthSize = responsive.wp(100);
    final double heigthSize = responsive.hp(100);
    return Card(
        elevation: 50,
        color: Colors.redAccent[200],
        shadowColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: widthSize,
            height: heigthSize / 2.5,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        catInfo.name ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 24),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        iconSize: 50,
                        color: Colors.white,
                        icon: const Icon(Icons.arrow_circle_right),
                        onPressed: () async => WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  settings: const RouteSettings(
                                      name: CatDetails.routeName),
                                  builder: (context) => CatDetails(catInfo),
                                ),
                              );
                            })),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: CachedNetworkImage(
                        fit: BoxFit.contain,
                        width: 260,
                        height: 330,
                        memCacheWidth: 260,
                        memCacheHeight: 330,
                        imageUrl: catInfo.image?.url ?? '',
                        placeholder: (context, url) =>
                            CircularProgressIndicator(
                          color: Colors.redAccent[200],
                        ),
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      catInfo.origin ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      catInfo.temperament?.split(',')[0] ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
