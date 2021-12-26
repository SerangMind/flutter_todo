import 'package:flutter/material.dart';
import 'package:flutter_todo/write.dart';

import 'data/todo.dart';
import 'data/util.dart';

void main() {
  runApp( MyApp() );
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoApp(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

class TodoApp extends StatefulWidget {
  const TodoApp({ Key key }) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();

}

class _TodoAppState extends State<TodoApp> {

  var _selectedTabIndex = 0;

  List<Todo> todos = [

    Todo( 
      title:    '책 2권 읽기',
      color:    Colors.cyanAccent.value,
      category: '독서',
      memo:     '부의 추월차선 읽기',
      done:     0,
      date:     20211225
    ),

    Todo( 
      title:    '헬스 2시간',
      color:    Colors.pinkAccent.value,
      category: '헬스',
      memo:     '어깨운동',
      done:     0,
      date:     20211225
    ),

    Todo( 
      title:    '강의듣기',
      color:    Colors.greenAccent.value,
      category: '강의',
      memo:     '앱개발 입문강의',
      done:     1,
      date:     20211225
    ),

  ];
  


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: PreferredSize(
        child: AppBar(),
        preferredSize: Size.fromHeight(0),
      ),
      
      body: Container( 
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (ctx, idx) {

            if ( idx == 0 ) {
              return Container(
                child: Text( '오늘하루',
                style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold ) ),
              );

            } else if ( idx == 1 ) {

              // 미완료된 목록만 찾아서
              List<Todo> undone = todos.where( (t) => ( t.done == 0 ) ).toList();

              return Column(
                children: List.generate( undone.length, (_idx) {
                    return _buildListItem( undone[_idx] );
                }),
              );

            } else if ( idx == 2 ) {         
              return Container(
                child: Text( '완료된 하루',
                  style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold ) ),
              );

            } else if ( idx == 3 ) {
               
              // 완료된 목록만 찾아서
              List<Todo> done = todos.where( (t) => ( t.done == 1 ) ).toList();

              return Column(
                children: List.generate( done.length, (_idx) {
                    return _buildListItem( done[_idx] );
                }),
              );

            }


            return null;
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
        onPressed: () async {
          print( 'floating action button');

          // 값을 받으려면 비동기/대기로 해야하는구나! 그렇지 않으면 Error
          Todo td = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => TodoWritePage( 
                    todo: Todo(
                      title: '',
                      color: Colors.blue.value,
                      category: '',
                      memo: '',
                      done: 0,
                      date: Utils.getFormatTime( DateTime.now())
                    )
                  ),
                  
                )
          );

          // 값을 정상적으로 입력하지 않고 빠져나올 경우 Back/그냥 저장인 경우 null
          try {

            setState(() {
              // if ( td.title != null ) {
                print( '저장완료: ${td.title}');
                todos.add(td);
              // }
            });

          } catch(e) {
            print( 'Error: $e' );
          }


        }
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedTabIndex,

        onTap: (index) {
          setState( () {
            _selectedTabIndex = index;
          } );
          print("$_selectedTabIndex Tab Clicked");
          
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: '오늘',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            label: '기록',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: '더보기',
          ),


            

        ],
      ),

    );

  }

  Widget _buildListItem( Todo todo ) {

    return Container(
      margin: EdgeInsets.symmetric( horizontal: 0, vertical: 6 ),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color( todo.color ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text( todo.title, 
                style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white ), ),
              Text( todo.done == 0 ? '미완료' : '완료',
                style: TextStyle( color: Colors.white ) ),
            ],
          ),
          SizedBox( height: 10,),
          Text( todo.memo, 
            style: TextStyle( color: Colors.white ) ),
        ],
      ),
    );

  }

}





// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
