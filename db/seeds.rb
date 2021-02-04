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
    { title: "Test3", level: 5, category: categories[0], author: users[1] }
  ])
# end

# unless Question.exists?

  for i in (1..22)
    if i <9
      Question.create!(title: "Question#{i}", test: tests[0])
    elsif i <17
      Question.create!(title: "Question#{i}", test: tests[1])
    else 
      Question.create!(title: "Question#{i}", test: tests[2])  
    end
  end
    # questions = Question.create!([
    #   { title: "Question1", test: tests[0] },
    #   { title: "Question2", test: tests[0] },
    #   { title: "Question3", test: tests[0] },
    #   { title: "Question4", test: tests[0] },
    #   { title: "Question5", test: tests[0] },
    #   { title: "Question6", test: tests[0] },
    #   { title: "Question7", test: tests[0] },
    #   { title: "Question8", test: tests[0] },
    #   { title: "Question9", test: tests[1] },
    #   { title: "Question10", test: tests[1] },
    #   { title: "Question11", test: tests[1] },
    #   { title: "Question12", test: tests[1] },
    #   { title: "Question13", test: tests[1] },
    #   { title: "Question14", test: tests[1] },
    #   { title: "Question15", test: tests[1] },
    #   { title: "Question16", test: tests[1] },
    #   { title: "Question17", test: tests[2] },
    #   { title: "Question18", test: tests[2] },
    #   { title: "Question19", test: tests[2] },
    #   { title: "Question20", test: tests[2] },
    #   { title: "Question21", test: tests[2] },
    #   { title: "Question22", test: tests[2] }
    # ])
# end

# unless Answer.exists?
questions = Question.all
#   for i in (1..58)
#     case i
#     when i<9 then Answer.create!(title: "Answer1 True", question: questions[0], correct: true 
#     when i<17 then Question.create!(title: "Question#{i}", test: tests[1])
#     else  = Question.create!(title: "Question#{i}", test: tests[2])  
#     end
#   end

  

  Answer.create!([
    { title: "Answer1 True", question: questions[0], correct: true },
    { title: "Answer2 False", question: questions[0] },
    { title: "Answer3 True", question: questions[1], correct: true },
    { title: "Answer4 False", question: questions[1] },
    { title: "Answer5 True", question: questions[2], correct: true },
    { title: "Answer6 False", question: questions[2] },
    { title: "Answer7 True", question: questions[3], correct: true },
    { title: "Answer8 False", question: questions[3] },
    { title: "Answer9 True", question: questions[4], correct: true },
    { title: "Answer10 False", question: questions[4] },
    { title: "Answer11 True", question: questions[5], correct: true },
    { title: "Answer12 False", question: questions[5] },
    { title: "Answer13 True", question: questions[6], correct: true },
    { title: "Answer14 False", question: questions[6] },
    { title: "Answer15 True", question: questions[7], correct: true },
    { title: "Answer16 False", question: questions[7] },
    { title: "Answer17 True", question: questions[8], correct: true },
    { title: "Answer18 False", question: questions[8] },
    { title: "Answer19 True", question: questions[9], correct: true },
    { title: "Answer20 False", question: questions[9] },
    { title: "Answer21 True", question: questions[10], correct: true },
    { title: "Answer22 False", question: questions[10] },
    { title: "Answer23 True", question: questions[11], correct: true },
    { title: "Answer24 False", question: questions[11] },
    { title: "Answer25 True", question: questions[12], correct: true },
    { title: "Answer26 False", question: questions[12] },
    { title: "Answer27 True", question: questions[13], correct: true },
    { title: "Answer28 False", question: questions[13] },
    { title: "Answer29 True", question: questions[14], correct: true },
    { title: "Answer30 False", question: questions[14] },
    { title: "Answer31 True", question: questions[15], correct: true },
    { title: "Answer32 False", question: questions[15] },
    { title: "Answer33 True", question: questions[16], correct: true },
    { title: "Answer34 False", question: questions[16] },
    { title: "Answer35 True", question: questions[17], correct: true },
    { title: "Answer36 False", question: questions[17] },
    { title: "Answer37 True", question: questions[18], correct: true },
    { title: "Answer38 False", question: questions[18] },
    { title: "Answer39 True", question: questions[19], correct: true },
    { title: "Answer40 False", question: questions[19] },
    { title: "Answer41 True", question: questions[20], correct: true },
    { title: "Answer42 False", question: questions[20] },
    { title: "Answer43 True", question: questions[21], correct: true },
    { title: "Answer44 False", question: questions[21] }
  ])
# end

# unless TestsUser.exists?
  # TestsUser.create!([
  #   { user: users[0], passed_test: tests[0] },
  #   { user: users[0], passed_test: tests[1] },
  #   { user: users[0], passed_test: tests[2] }
  # ])

end
