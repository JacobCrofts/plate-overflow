names = ["Tyrion", "Melisandre", "Brienne", "Eddard"]
emails = ["tyrionlannister@gmail.com", "rhloorisbae@gmail.com", "fuckstannis@gmail.com", "winteriscoming@gmail.com"]

question_titles = ["Spork -vs- Fork", "Tacos", "Important", "Book"]
question_contents = ["All right guys. I know this is a bit of a hot button issue, but I have to know. Which utensil is truly better: the spork or the fork?", "Anyone have a great recipe for tacos they would like to share", "Who is the one true chef of Westeros?", "When is George R.R. Martin finishing his next cookbook?"]

answer_content = ["Well there are two camps of people in this. Those who believe forks are better, and those who are wrong.", "Nah.", "Stannis is the one true chef.", "Probably not any time soon. His cooking show is actually fully caught up with his recipe books. I'm not sure what they're going to do from this point on..."]
comment_content = ["Well this escalated quickly...", "Thank you so much.", "Joffrey is the one true chef!", "I'll be waiting..."]

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
