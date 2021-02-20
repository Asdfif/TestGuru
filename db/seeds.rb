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
    { email: "U1@mail.ru", password: '123456', first_name: 'U1', last_name: 'AAA', type: "Admin" },
    { email: "U2@mail.ru", password: '123456', first_name: 'U2', last_name: 'BBB', type: "Admin"  },
    { email: "U3@mail.ru", password: '123456', first_name: 'U3', last_name: 'CCC'}
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


# unless Answer.exists?
questions = Question.all
  for j in (1..22)
    for i in (1..2)
      Answer.create!(
        title: "Answer#{ if i == 1 
                            (j*2-i) 
                          else 
                            (j*2) 
                          end
                        }", question: questions[j-1], correct: i==1)
    end
  end

end
