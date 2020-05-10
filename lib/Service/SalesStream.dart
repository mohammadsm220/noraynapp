
class SalesStream {
  final String imageURL;
  final String name;
  final int price; 

SalesStream({ this.imageURL,this.name,this.price});

 factory SalesStream.fromMap(Map data){
    data=data ??{ };
    return 
  SalesStream(
      imageURL: data['imageURL'] ,
      name:  data['name'],
      price:  data['price'],
    );
  }
}