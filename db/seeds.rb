# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Test.exists?
  c = Category.create!([
    {title: 'c1'},
    {title: 'c2'}
  ])

  u = User.create!([
    {name: 'U1'},
    {name: 'U2'}
  ])

  t = Test.create!([
    {title: 't1', category_id: c[0].id, author_id: u[0].id},
    {title: 't2', category_id: c[1].id, author_id: u[1].id}
  ]) 

  q = Question.create!([
    {title: 'q1', test_id: t[0].id},
    {title: 'q2', test_id: t[0].id},
    {title: 'q3', test_id: t[0].id},
    {title: 'q4', test_id: t[1].id},
    {title: 'q5', test_id: t[1].id},
    {title: 'q6', test_id: t[1].id},

  ])

  a = Answer.create!([
    {title: 'a1', question_id: q[0].id correct: true},
    {title: 'a2', question_id: q[0].id},
    {title: 'a3', question_id: q[1].id},
    {title: 'a4', question_id: q[1].id, correct: true},
    {title: 'a5', question_id: q[2].id},
    {title: 'a6', question_id: q[2].id},
    {title: 'a7', question_id: q[2].id, correct: true},
    {title: 'a8', question_id: q[3].id, correct: true},
    {title: 'a9', question_id: q[3].id},
    {title: 'a10', question_id: q[3].id},
    {title: 'a11', question_id: q[4].id},
    {title: 'a12', question_id: q[4].id, correct: true},
    {title: 'a13', question_id: q[5].id},
    {title: 'a14', question_id: q[5].id, correct: true},

  ])

  UserTest.create!([
    {user_id: u[0].id, test_id: t[0].id},
    {user_id: u[0].id, test_id: t[1].id}
  ])
end
