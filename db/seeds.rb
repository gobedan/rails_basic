
Category.create([{title: 'Computer Science'}, {title: 'Pshychology'}, {title: 'Engineering'}])
Test.create([{title: 'Strength of materials', level: 3, category_id: 3}, 
              {title: 'Binary tree search algorithms', level: 3, category_id: 1},
              {title: 'Strength of materials BASIC', level: 2, category_id: 3}, 
              {title: 'What is your favorite movie genre?', level: 1, category_id: nil},
              {title: 'Child Education', level: 2, category_id: 2}
             ])
Question.create([{body: 'Which movie you have seen the first?', test_id: 4}, 
                  {body: 'What is logarithmical cost model?', test_id: 2}, 
                  {body: 'Which age child behavior crysis is associated with?', test_id: 5}, 
                  {body: 'Why binary tree is called ''binary''?', test_id: 2}, 
                  {body: 'What is the strongest material used for aircraft?', test_id: 3}
                 ])
Answer.create([{body: 'Requiem for a Dream', correct: true, question_id: 1},
                {body: 'Marvel superhero movie', correct: false, question_id: 1},
                {body: 'Model that shows how much decimal logarithm calculation costs', correct: false, question_id: 2},
                {body: 'Model that assigns a calculations cost to every machine operation proportional to the number of bits involved', correct: true, question_id: 2},
                {body: '5 years', correct: false, question_id: 3},
                {body: '3 years', correct: true, question_id: 3},
                {body: 'Because it stored in bytes in memory just using ones and zeroes', correct: false, question_id: 4},
                {body: 'Because every parent node can have no more than 2 childs', correct: true, question_id: 4},
                {body: 'Aluminium', correct: false, question_id: 5},
                {body: 'Titanium', correct: true, question_id: 5},
               ])
User.create([{name: 'Gobedan', admin: true}, {name: 'Customer1', admin: false}])
