// Source - https://stackoverflow.com/a/67121271
// Posted by awaik
// Retrieved 2025-11-27, License - CC BY-SA 4.0

prefixIcon: IconButton(
onPressed: () {
print('search button pressed');
},
icon: Icon(Icons.search),
),
suffixIcon: Container(
width: 100,
child: Row(
children: [
IconButton(
onPressed: () {
print('add button pressed');
},
icon: Icon(Icons.add),
),
IconButton(
onPressed: () {
print('mic button pressed');
},
icon: Icon(Icons.mic),
),
],
),
),
