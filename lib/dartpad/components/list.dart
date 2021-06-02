import 'package:flutter/material.dart';

class ListCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _buildImagePlaceholder(double height) {
      return Center(
        child: Icon(
          Icons.photo,
          size: height,
        ),
      );
    }

    _buildNetworkImageProgressIndicator(double width, double height) {
      return Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
    }

    _buildNetworkImage(String imageUrl) {
      final double width = 80;
      final double height = 80;
      try {
        if (imageUrl == "") return _buildImagePlaceholder(height);
        return Image.network(
          imageUrl,
          width: width,
          height: height,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return _buildNetworkImageProgressIndicator(width, height);
          },
        );
      } catch (e) {
        return _buildImagePlaceholder(height);
      }
    }

    _buildListView() {
      return ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            // var brand = brands.elementAt(index);
            return Column(
              children: [
                ListTile(
                  title: Text("test"),
                  // leading: _buildNetworkImage(brand.imageUrl),
                  // onTap: () => _handleListItemOnTap(brand),
                ),
                Divider(height: 1),
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("List Preview"),
      ),
      body: _buildListView(),
    );
  }
}
