
class ImagesStream {
  final String imageURL;
  
ImagesStream({ this.imageURL});

 factory ImagesStream.fromMap(Map data){
    data=data ??{ };
    return 
  ImagesStream(
      imageURL: data['imageURL'] ,
    );
  }
}