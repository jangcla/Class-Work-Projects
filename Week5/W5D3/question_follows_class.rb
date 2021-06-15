require 'sqlite3'
require 'singleton'
require 'questions_class'
require 'users_class'
require 'replies_class'

class QuestionFollowsDBConnection < SQLite3::Database
  include Singleton
  def initialize
    super('aa_questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end


class QuestionFollows
  attr_reader :id
  attr_accessor :reply, :users_id, :question_id, :reply_id

  def self.all
    data = QuestionFollowsDBConnection.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| QuestionFollows.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @follower_id = options['follower_id']
    @questions_id = options['questions_id']
  end

  def self.followers_for_question_id(question_id)
    data = QuestionFollowsDBConnection.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        users
      JOIN
        question_follows
      ON
        users.id = question_follows.follower_id
      WHERE
        question_follows.question_id = question_id
    SQL
    data.map { |datum| QuestionFollows.new(datum) }
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionFollowsDBConnection.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        questions
      JOIN
        question_follows
      ON
        questions.id = question_follows.questions_id
      WHERE
        question_follows.user_id = user_id
    SQL
    data.map { |datum| QuestionFollows.new(datum) }
  end

end
