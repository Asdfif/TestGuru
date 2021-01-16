# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Test.exists?
  Category.create!([
    {title: 'c1'},
    {title: 'c2'}
  ])

  User.create!([
    {name: 'U1'},
    {name: 'U2'}
  ])

  Test.create!([
    {title: 't1', category_id: Category.all[0].id, author_id: User.all[0].id},
    {title: 't2', category_id: Category.all[1].id, author_id: User.all[1].id}
  ]) 

  Question.create!([
    {title: 'q1', test_id: Test.all[0].id},
    {title: 'q2', test_id: Test.all[0].id},
    {title: 'q3', test_id: Test.all[0].id},
    {title: 'q4', test_id: Test.all[1].id},
    {title: 'q5', test_id: Test.all[1].id},
    {title: 'q6', test_id: Test.all[1].id},

  ])

  Answer.create!([
    {title: 'a1', question_id: Question.all[0].id correct: true},
    {title: 'a2', question_id: Question.all[0].id},
    {title: 'a3', question_id: Question.all[1].id},
    {title: 'a4', question_id: Question.all[1].id, correct: true},
    {title: 'a5', question_id: Question.all[2].id},
    {title: 'a6', question_id: Question.all[2].id},
    {title: 'a7', question_id: Question.all[2].id, correct: true},
    {title: 'a8', question_id: Question.all[3].id, correct: true},
    {title: 'a9', question_id: Question.all[3].id},
    {title: 'a10', question_id: Question.all[3].id},
    {title: 'a11', question_id: Question.all[4].id},
    {title: 'a12', question_id: Question.all[4].id, correct: true},
    {title: 'a13', question_id: Question.all[5].id},
    {title: 'a14', question_id: Question.all[5].id, correct: true},

  ])

  UserTest.create!([
    {user_id: User.all[0].id, test_id: Test.all[0].id},
    {user_id: User.all[0].id, test_id: Test.all[0].id}
  ])
end
