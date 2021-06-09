require 'sqlite3'
require 'singleton'
require 'questions_class'
require 'users_class'

class RepliesDBConnection < SQLite3::Database
  include Singleton
  def initialize
    super('aa_questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end


class Replies
  attr_reader :id
  attr_accessor :reply, :users_id, :question_id, :reply_id

  def self.all
    data = RepliesDBConnection.instance.execute("SELECT * FROM replies")
    data.map { |datum| Replies.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @reply = options['reply']
    @users_id = options['users_id']
    @question_id = options['question_id']
    @reply_id = options['reply_id']
  end

  def self.find_by_user_id(user_id)
    data = RepliesDBConnection.instance.execute("SELECT * FROM replies WHERE user_id = #{user_id}")
    data.map { |datum| Replies.new(datum) }
  end

  def self.find_by_question_id(question_id)
    data = RepliesDBConnection.instance.execute("SELECT * FROM replies WHERE question_id = #{question_id}")
    data.map { |datum| Replies.new(datum) }
  end

  def author
    Users.find_by_id(self.user_id)
  end

  def question
    data = QuestionsDBConnection.instance.execute("SELECT * FROM questions WHERE id = #{self.question_id}")
    data.map { |datum| Questions.new(datum) }
  end

  def parent_reply
    data = RepliesDBConnection.instance.execute("SELECT * FROM replies WHERE reply_id = #{self.id}")
    data.map { |datum| Replies.new(datum) }
  end

  def child_replies
    data = RepliesDBConnection.instance.execute("SELECT * FROM replies WHERE id = #{self.reply_id}")
    data.map { |datum| Replies.new(datum) }
  end

end
