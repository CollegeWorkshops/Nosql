//Create

db.games.insert({'title' : 'Need For Speed' , 'user_rating' : 90 , 'cost' : 500 , 'platforms' : ['PC','PS2']});

//Read

db.games.find({'cost' : 500}).limit(1);
db.games.find({'platforms' : 'XBOX360'} , {'platforms' : 1 , 'cost' : 1}).sort({'cost' : 1});
db.games.find({'platforms' : 'XBOX360'} , {'platforms' : 1 , 'cost' : 1}).sort({'cost' : 1}).limit(5);

//Update

db.games.update({'cost' : 450} , { $inc : { 'user_rating' : 1}});

db.games.find({'cost' : { $lt : 600}} , { 'cost' : 1 , 'user_rating' : 1});
db.games.update({'cost' : { $lt : 600}} , { $inc : { 'user_rating' : 1 }});

db.games.update({'cost' : { $lt : 600}} , { $inc : { 'user_rating' : 1 } } , { 'multi' : true});


//Delete

db.games.remove({'title' : 'Hitman 1'});


//GroupBy
