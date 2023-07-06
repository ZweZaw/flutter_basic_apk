import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart' show kTransparentImage ;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
class ImageExample extends StatelessWidget {
  const ImageExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          const ListTile(
            title: Text("Image From Asset:"),
          ),
          Card(
            child: Image.asset("images/img1.png"),
          ),
          const Divider(),
          const ListTile(
            title: Text("image from Asset2:"),
          ),
          Card(
            child: Image.asset("images/img2.jpg"),
          ),
          const Divider(),
          const ListTile(
            title: Text("image from URL:"),
          ),
          Card(
            child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: "https://i.picsum.photos/id/1011/367/267.jpg?hmac=DiajkYnQXUMcq-NjU4MUCAIielJRvpwQK4ZRtL_ycmE"),
          ),
          const Divider(),
          const ListTile(
            title: Text("Cached network image:"),
          ),
          CachedNetworkImage(
            imageUrl: "https://1409791524.rsc.cdn77.org/data/images/full/539384/blackpinks-lisa-named-asias-most-beautiful-woman-of-2019-list-of-asias-most-beautiful-and-handsome-faces.jpg",
            placeholder: (context,url){
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            errorWidget: (context,url,error){
              return const Icon(Icons.error);
            },
          ),
          const Divider(),
          const ListTile(
            title: Text("Extended Image"),
            subtitle: Text("provides more functionalities like image caching, shape,border radius and editing"),
          ),
          ExtendedImage.network(
              "https://1409791524.rsc.cdn77.org/data/images/full/539384/blackpinks-lisa-named-asias-most-beautiful-woman-of-2019-list-of-asias-most-beautiful-and-handsome-faces.jpg",
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(20),)
          ),
        ],
      ),
    );
  }
}
