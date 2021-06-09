require 'sqlite3'
require 'singleton'
require 'users_class'

class QuestionsDBConnection < SQLite3::Database
  include Singleton
  def initialize
    super('aa_questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end


class Questions
  attr_reader :id
  attr_accessor :title, :body, :author_id

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM questions")
    data.map { |datum| Questions.new(datum) }
  end

  def initialize(options)
    @id = option['id']
    @title = option['title']
    @body = option['body']
    @author_id = option['author_id']
  end

  def self.find_by_author_id(author_id)
    data = QuestionsDBConnection.instance.execute("SELECT * FROM questions WHERE author_id = #{author_id}")
    data.map { |datum| Questions.new(datum) }
  end

  def author
    author = Users.find_by_id(self.author_id)
    "#{author.fname} #{author.lname}"
  end

  def replies
    Replies.find_by_question_id(self.id)
  end

end
