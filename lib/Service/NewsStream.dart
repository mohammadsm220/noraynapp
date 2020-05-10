
class News {
  final String title;
  
News({ this.title});

   

// News.toJson(Map<String,String> news)
// :title = news['News'];

// }

 factory News.fromMap(Map data){
    data=data ??{ };
    return 
  News(
      title: data['title'] ,
    );
  }
}