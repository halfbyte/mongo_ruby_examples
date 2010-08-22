{ 
  "_id" : ObjectId("4c00245062610475a005afcd"), 
  "address" : "Bernstorffstr. 174\n22767 Hamburg\nDE", 
  "description" : null, 
  "position" : { "lat" : 53.5600912, "lng" : 9.9596977 }, 
  "tags" : [ "hausarzt", "naturheilverfahren", "akupunktur", "allgemeinmedizin" ], 
  "title" : "Dr. med. Lilo Eisenbarth", 
  "loxicon_id" : 808261 
}



> use test
switched to db test

db.quotes.save({text: "You can observe a lot just by watching.", from: "Yogi Berra", created_at: new Date() });
db.quotes.save({text: "Silence is one of the hardest arguments to refute.", from: "Josh Billings", created_at: new Date() });
db.quotes.find();
db.quotes.find({from: "Yogi Berra"});
{ 
  "_id" : ObjectId("4c0022551496fc2051e93695"), 
  "text" : "You can observe a lot just by watching.", 
  "from" : "Yogi Berra", 
  "created_at" : "Fri May 28 2010 22:06:45 GMT+0200 (CEST)" 
}

db.quotes.find({from: {"$ne": "Yogi Berra"}});
{ 
  "_id" : ObjectId("4c0022551496fc2051e93696"), 
  "text" : "Silence is one of the hardest arguments to refute.", 
  "from" : "Josh Billings", 
  "created_at" : "Fri May 28 2010 22:06:45 GMT+0200 (CEST)" 
}

db.quotes.find({from:{ "$in":["Yogi Berra","Josh Billings"]}});
{ "_id" : ObjectId("4c0022551496fc2051e93695"), "text" : "You can..."...}
{ "_id" : ObjectId("4c0022551496fc2051e93696"), "text" : "Silence..."...}

db.arrays.save({list: [1,2,3]});
db.arrays.save({list: [4,5,6]});
db.arrays.save({list: [3,4,5]});

db.arrays.find({list:{ "$in":[3,4]}});
{ "_id" : ObjectId("4c0025461496fc2051e93697"), "list" : [ 1, 2, 3 ] }
{ "_id" : ObjectId("4c0025501496fc2051e93698"), "list" : [ 4, 5, 6 ] }
{ "_id" : ObjectId("4c0025591496fc2051e93699"), "list" : [ 3, 4, 5 ] }

db.arrays.find({list:{ "$all":[3,5]}});
{ "_id" : ObjectId("4c0025591496fc2051e93699"), "list" : [ 3, 4, 5 ] }


db.arrays.find({list:{ "$mod":[4,0]}});
{ "_id" : ObjectId("4c0025501496fc2051e93698"), "list" : [ 4, 5, 6 ] }
{ "_id" : ObjectId("4c0025591496fc2051e93699"), "list" : [ 3, 4, 5 ] }

db.arrays.find({list:{ "$size":3}});     
{ "_id" : ObjectId("4c0025461496fc2051e93697"), "list" : [ 1, 2, 3 ] }
{ "_id" : ObjectId("4c0025501496fc2051e93698"), "list" : [ 4, 5, 6 ] }
{ "_id" : ObjectId("4c0025591496fc2051e93699"), "list" : [ 3, 4, 5 ] }

db.arrays.find({list: {"$exists": true}});

db.arrays.find({list: {"$type": 1}});


db.quotes.find({from: /^Yog/});
[...]
db.quotes.find("this.from == 'Yogi Berra'");
[...]
db.quotes.find({"$where": "this.from == 'Yogi Berra'"});
[...]

// SORT, LIMIT, SKIP, etc.

db.quotes.find().sort({from:1})                         
{"from" : "Josh Billings" ... }
{"from" : "Yogi Berra"     ...}
db.quotes.find().sort({from:-1})
{"from" : "Yogi Berra"     ...}
{"from" : "Josh Billings" ... }

db.quotes.find().count(); 
2


// INDEXING
db.quotes.ensureIndex({from: 1});
db.quotes.ensureIndex({from: -1});
db.quotes.ensureIndex({text: 1}, {unique: true});
db.quotes.ensureIndex({from: 1, text: 1});

db.quotes.dropIndexes();
db.quotes.dropIndex({from: 1, text: 1});
db.quotes.reIndex();
