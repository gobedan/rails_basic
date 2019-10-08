
categories = Category.create!([{title: 'Computer Science'}, {title: 'Pshychology'}, {title: 'Engineering'}])
tests = Test.create!([{title: 'Strength of materials', level: 3, category_id: categories[2].id}, 
              {title: 'Binary tree search algorithms', level: 3, category_id: categories[0].id},
              {title: 'Strength of materials BASIC', level: 2, category_id: categories[2].id}, 
              {title: 'What is your favorite movie genre?', level: 1, category_id: nil},
              {title: 'Child Education', level: 2, category_id: categories[1].id}
             ])
questions = Question.create!([{body: 'Which movie you have seen the first?', test_id: tests[3].id}, 
                  {body: 'What is logarithmical cost model?', test_id: tests[3].id}, 
                  {body: 'Which age child behavior crysis is associated with?', test_id: tests[4].id}, 
                  {body: 'Why binary tree is called ''binary''?', test_id: tests[1].id}, 
                  {body: 'What is the strongest material used for aircraft?', test_id: tests[2].id}
                 ])
answers = Answer.create!([{body: 'Requiem for a Dream', correct: true, question_id: questions[0].id},
                {body: 'Marvel superhero movie', correct: false, question_id: questions[0].id},
                {body: 'Model that shows how much decimal logarithm calculation costs', correct: false, question_id: questions[1].id},
                {body: 'Model that assigns a calculations cost to every machine operation proportional to the number of bits involved', correct: true, question_id: questions[1].id},
                {body: '5 years', correct: false, question_id: questions[2].id},
                {body: '3 years', correct: true, question_id: questions[2].id},
                {body: 'Because it stored in bytes in memory just using ones and zeroes', correct: false, question_id: questions[3].id},
                {body: 'Because every parent node can have no more than 2 childs', correct: true, question_id: questions[3].id},
                {body: 'Aluminium', correct: false, question_id: questions[4].id},
                {body: 'Titanium', correct: true, question_id: questions[4].id},
               ])
users = User.create!([{name: 'Gobedan', admin: true}, {name: 'Customer1', admin: false}])
user_tests = UserTest.create!([{user_id: users[1].id, test_id: tests[3].id}])
