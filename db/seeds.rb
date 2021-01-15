# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or first_or_created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


c1 = Category.first_or_create(title: 'c1')
c2 = Category.first_or_create(title: 'c2')

u1 = User.first_or_create(name: 'U1')
u2 = User.first_or_create(name: 'U2')

t1 = Test.first_or_create(title: 't1', category_id: c1.id, author_id: u1.id)
t2 = Test.first_or_create(title: 't2', category_id: c2.id, author_id: u1.id)

q1 = Question.first_or_create(title: 'q1', test_id: t1.id)
q2 = Question.first_or_create(title: 'q2', test_id: t2.id)

a1 = Answer.first_or_create(title: 'a1', question_id: q1.id)
a2 = Answer.first_or_create(title: 'a2', question_id: q2.id)

u1t1 = UserTest.first_or_create(user_id: u1.id, test_id: t1.id)
u1t2 = UserTest.first_or_create(user_id: u1.id, test_id: t2.id)
