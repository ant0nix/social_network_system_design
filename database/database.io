Table subscriptions {
  userID uuid
  followingUser uuid
  created_at timestamp 
}

Table users {
  id uuid [primary key]
  login varchar
  password varchar
  email varchar
  fName varchar
  lName varchar
  bithDate date
  createdAt timestamp
}

Table posts {
  id uuid [primary key]
  description varchar
  ownerID uuid
  location uuid
  media varchar[]
  reactions integer
  views integer
  createdAt timestamp
}

Table comments {
  id uuid
  ownerID uuid
  message varchar
  createdAt timestamp
}

Table locations{
  id uuid [primary key]
  country varchar
  place varchar
  geotagX float
  geotagY float
  views integer [Note:"Per day"]
}

//in cashe. UPD 1 time per 24h
Table hotPosts{
  postID uuid
}
Table hotPlaces{
  placeID uuid
}
Table hotAutors{
  userID uuid
}

 Ref: posts.ownerID > users.id
 Ref: users.id < subscriptions.userID
 Ref: subscriptions.followingUser - users.id
 Ref: posts.location > locations.id
 Ref: hotPosts.postID - posts.id
 Ref: hotPlaces.placeID - locations.id
 Ref: hotAutors.userID - users.id
 Ref: comments.ownerID <> users.id
 Ref: comments.id > posts.id
