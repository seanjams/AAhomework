# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
    {username: "Bob"},
    {username: "Wen"},
    {username: "Sean"},
    {username: "Will"},
    {username: "Kelly"}
  ])

art_works = ArtWork.create([
    {title: "A", image_url: "stuff1", artist_id: 1},
    {title: "B", image_url: "stuff2", artist_id: 2},
    {title: "C", image_url: "stuff3", artist_id: 3},
    {title: "Dup", image_url: "stuff4", artist_id: 4},
    {title: "E", image_url: "stuff5", artist_id: 5},
    {title: "Dup", image_url: "stuff6", artist_id: 1}
  ])

art_work_shares = ArtWorkShare.create([
    {art_work_id: 1, viewer_id: 2},
    {art_work_id: 2, viewer_id: 1},
    {art_work_id: 4, viewer_id: 1}
  ])
