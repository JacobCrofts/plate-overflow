names = ["Tyrion", "Melisandre", "Brienne", "Eddard"]
emails = ["tyrionlannister@gmail.com", "rhloorisbae@gmail.com", "fuckstannis@gmail.com", "winteriscoming@gmail.com"]

question_titles = ["question 1", "question 2", "question 3", "question 4"]
question_contents = ["q1 content", "q2 content", "q3 content", "q4 content"]

answer_content = ["answer 1", "answer 2", "answer 3", "answer 4"]
comment_content = ["comment 1", "comment 2", "comment 3", "comment 4"]

(0..3).each do |i|
  User.create(username: names[i], password: "password", email: emails[i])
  q = Question.create(title: question_titles[i], content: question_contents[i], author_id: rand(4) + 1)
  a = Answer.create(content: answer_content[i], author_id: rand(4) + 1, question_id: (i + 1))
  a.comments.create(content: comment_content[i], author_id: rand(4) + 1)
  a.votes.create(voter_id: i + 1, value: 1)
  q.comments.create(content: comment_content[i], author_id: rand(4) + 1)
  q.votes.create(voter_id: i + 1, value: 1)
  Tag.create(name: "derp #{i + 1}")
  QuestionsTag.create(question_id: i + 1, tag_id: i + 1)
end
