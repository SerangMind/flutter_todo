import 'package:flutter/material.dart';

import 'data/todo.dart';

class TodoWritePage extends StatefulWidget {

  final Todo todo;

  const TodoWritePage({ Key key, this.todo }) : super(key: key);
  
  @override
  _TodoWritePageState createState() => _TodoWritePageState();
}

class _TodoWritePageState extends State<TodoWritePage> {
  
  TextEditingController titleController = TextEditingController();
  TextEditingController memoController = TextEditingController();

  int colorIndex = 0;
  List<Color> colors = [
    Color(0xFF80D3F4),
    Color(0xFFA794FA),
    Color(0xFFFB91D1),
    Color(0xFFFB8A94),
    Color(0xFFF3BD9A),
    Color(0xFFFFFFFF),
  ];

  int categoryIndex = 0;
  List<String> categories = [ '공부', '운동', '게임' ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        // title: Text('...'),
        actions: [
          TextButton(
            child: Text( '저장', style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white ), ),
            onPressed: () { 
              print( '저장버튼' ); 
              widget.todo.title = titleController.text;
              widget.todo.memo = memoController.text;
            
              Navigator.of(context).pop( widget.todo );
            }
          )
        ],
      ),

      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (ctx, idx) {
          
          if ( idx == 0 ) {
            return Container(
              margin: EdgeInsets.fromLTRB( 15, 12, 15, 0 ),
              child: Text( '제목', style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold ) )
            
            );

          } else if ( idx == 1 ) {
            return Container(
              margin: EdgeInsets.symmetric( horizontal: 15 ),
              child: TextField(
                controller: titleController,
              )

            );

          } else if ( idx == 2 ) {
            return Container(
              margin: EdgeInsets.symmetric( vertical: 12, horizontal: 15 ),
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text( '색상', style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold ) ),
                    Container(
                      width: 20,
                      height: 20,
                      color: Color( widget.todo.color )
                    )
                  ],
                ),
                onTap: () {
                  colorIndex = ( (colorIndex++) + 1 ) % colors.length;
                  setState(() {
                    widget.todo.color = colors[colorIndex].value;
                  });

                },
              )
            
            );

          } else if ( idx == 3 ) {
            return Container(
              margin: EdgeInsets.symmetric( vertical: 12, horizontal: 15 ),
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text( '카테고리', style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold ) ),
                    Text( widget.todo.category, style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold ) )
                  ],
                ),
                onTap: () {
                  categoryIndex = ( ( categoryIndex++ ) + 1 ) % categories.length;
                  setState(() {
                    widget.todo.category = categories[categoryIndex];
                  });
                },

              ),
              
            );

          } else if ( idx == 4 ) {
            return Container(
              margin: EdgeInsets.symmetric( vertical: 12, horizontal: 15 ),
              child: Text( '내용', style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold ) )
            
            );
          
          } else if ( idx == 5 ) {
            return Container(
              margin: EdgeInsets.symmetric( vertical: 12, horizontal: 15 ),
              child: TextField(
                controller: memoController,
                maxLines: 10,
                minLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder( borderSide: BorderSide( color: Colors.black ) ),
                ),
              )

            );

          } else {
            return Container();
          }

        }

      )

    );
  }
}