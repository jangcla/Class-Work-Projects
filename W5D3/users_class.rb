require 'sqlite3'
require 'singleton'

class UsersDBConnection < SQLite3::Database
  include Singleton
  def initialize
    super('aa_questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end


class Users
  attr_reader :id
  attr_accessor :fname, :lname

  def self.all
    data = UsersDBConnection.instance.execute("SELECT * FROM users")
    data.map { |datum| Users.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def self.find_by_id(id)
    data = UsersDBConnection.instance.execute("SELECT * FROM users WHERE id = #{id}")
    data.map { |datum| Users.new(datum) }
  end

  def self.find_by_name(fname, lname)
    data = UsersDBConnection.instance.execute("SELECT * FROM users WHERE fname = #{fname} AND lname = #{lname}")
  end

  

end