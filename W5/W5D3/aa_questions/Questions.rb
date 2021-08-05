require "sqlite3"
require "singleton"

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end

end

class Users

  attr_accessor :id, :fname, :lname

  def self.all
    data = QuestionsDatabase.instance.execute('SELECT * FROM users')
    data.map { |datum| Users.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def self.find_by_id(id)
    user1 = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT * FROM users WHERE id = ?
    SQL
    Users.new(user1.first)
  end

  def self.find_by_name(fname, lname)
    user1 = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
    SELECT * FROM users WHERE fname = ? AND lname = ?
    SQL
    Users.new(user1.first)
  end

  def authored_questions
    Questions.find_by_author_id(self.id)
  end

  def authored_replies
    Replies.find_by_user_id(self.id)
  end
end

class Questions

  attr_accessor :id, :title, :body, :users_id

  def self.all
    data = QuestionsDatabase.instance.execute('SELECT * FROM questions')
    data.map { |datum| Questions.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @users_id = options['users_id']
  end

  def self.find_by_id(id)
    user1 = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT * FROM questions WHERE id = ?
    SQL
    Questions.new(user1.first)
  end

  def self.find_by_author_id(users_id)
    user1 = QuestionsDatabase.instance.execute(<<-SQL, users_id)
    SELECT * FROM questions WHERE users_id = ?
    SQL
    user1.map { |data| Questions.new(data) }
  end

  def author
    self.users_id
  end

  def replies
    Replies.find_by_question_id(self.id)
  end


end

class QuestionFollows

  attr_accessor :id, :question_id, :users_id

  def self.all
    data = QuestionsDatabase.instance.execute('SELECT * FROM question_follows')
    data.map { |datum| QuestionFollows.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @users_id = options['users_id']
  end

  def self.find_by_id(id)
    user1 = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT * FROM question_follows WHERE id = ?
    SQL
    QuestionFollows.new(user1.first)
  end

  def self.followers_for_question_id(question_id)
    user1 = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      users.id, users.fname, users.lname
    FROM
      question_follows
    JOIN users ON
      question_follows.users_id = users.id
    WHERE
      question_id = ?
    SQL
    user1.map {|datum| Users.new(datum)}
  end

  def self.followed_questions_for_user_id(users_id)
    user1 = QuestionsDatabase.instance.execute(<<-SQL, users_id)
    SELECT
      *
    FROM
      question_follows
    JOIN questions ON
      question_follows.users_id = questions.users_id
    WHERE
      users_id = ?
    SQL
    user1.map {|datum| Questions.new(datum)}
  end
end

class Replies

  attr_accessor :id, :body, :question_id, :users_id, :parent_id

  def self.all
    data = QuestionsDatabase.instance.execute('SELECT * FROM replies')
    data.map { |datum| Replies.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @users_id = options['users_id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
  end

  def self.find_by_id(id)
    user1 = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT * FROM replies WHERE id = ?
    SQL
    Replies.new(user1.first)
  end

  def self.find_by_user_id(users_id)
    user1 = QuestionsDatabase.instance.execute(<<-SQL, users_id)
    SELECT * FROM replies WHERE users_id = ?
    SQL
    Replies.new(user1.first)
  end

  def self.find_by_question_id(question_id)
    user1 = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT * FROM replies WHERE question_id = ?
    SQL
    user1.map { |data| Replies.new(data) }
  end

  def author
    self.users_id
  end

  def question
    self.question_id
  end

  def parent_reply
    self.parent_id
  end

  def child_replies
    if self.parent_id == nil
      user1 = QuestionsDatabase.instance.execute(<<-SQL, self.id)
      SELECT * FROM replies WHERE parent_id = ?
      SQL
      user1.map { |datum| Replies.new(datum) }
    end
  end
end

class QuestionLikes

  attr_accessor :id, :question_id, :users_id

  def self.all
    data = QuestionsDatabase.instance.execute('SELECT * FROM question_likes')
    data.map { |datum| QuestionLikes.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @users_id = options['users_id']
  end

  def self.find_by_id(id)
    user1 = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT * FROM question_likes WHERE id = ?
    SQL
    QuestionLikes.new(user1.first)
  end


end