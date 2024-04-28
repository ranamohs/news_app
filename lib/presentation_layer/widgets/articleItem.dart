
import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
   ArticleItem({super.key , this.article});

dynamic article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                // image: DecorationImage(image: NetworkImage('https://www.psychologicalscience.org/redesign/wp-content/uploads/2021/06/FakeNewsImage.png' ?? NetworkImage('${article['urlToImage']}')))
                image: DecorationImage(image: NetworkImage('${article['urlToImage']}' ),fit: BoxFit.cover)
            ),
          ),
          SizedBox(width: 20.0,),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text('${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text('${article['publishedAt']}' , style: TextStyle(
                      color: Colors.grey
                  ),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
