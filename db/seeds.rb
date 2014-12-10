# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Article.create({
  title:'My first post',
  body: 'Just testing this thing out. Will people read?'
  })

Article.create({
  title:'Ruby On Rails',
  body: 'I relly dig it! It allows me to quickly build applications for users.'
  })

# TODO uncomment once the Tag model is created
# Tag.create([{name: 'Rails'},{name: 'Work'},{name: 'Vacation'}])
