# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Test.exists? #&& Category.exists? && User.exists?  && Question.exists? && Answer.exists? 
  categories = Category.create!([
    { title: "Category1" },
    { title: "Category2" }
  ])
# end

# unless User.exists?
  users = User.create!([
    { name: "User1", email: "User1@mail.ru" },
    { name: "User2", email: "User2@gmail.com" }
  ])
# end

# unless Test.exists?
  tests = Test.create!([
    { title: "Test1",           category: categories[0], author: users[0] },
    { title: "Test2", level: 1, category: categories[1], author: users[1] },
    { title: "Test3", level: 1, category: categories[0], author: users[1] }
  ])
# end

# unless Question.exists?
  questions = Question.create!([
    { title: "Question1", test: tests[0] },
    { title: "Question2", test: tests[0] },
    { title: "Question3", test: tests[1] },
    { title: "Question4", test: tests[1] },
    { title: "Question5", test: tests[2] },
    { title: "Question6", test: tests[2] }
  ])
# end

# unless Answer.exists?
  Answer.create!([
    { title: "Answer1", question: questions[0], correct: true },
    { title: "Answer2", question: questions[0] },
    { title: "Answer3", question: questions[1], correct: true },
    { title: "Answer4", question: questions[1] },
    { title: "Answer5", question: questions[2] },
    { title: "Answer6", question: questions[3], correct: true },
    { title: "Answer7", question: questions[4] },
    { title: "Answer8", question: questions[5] }
  ])
# end

# unless TestsUser.exists?
  TestsUser.create!([
    { user: users[0], passed_test: tests[0] },
    { user: users[0], passed_test: tests[1] },
    { user: users[0], passed_test: tests[2] }
  ])

end
