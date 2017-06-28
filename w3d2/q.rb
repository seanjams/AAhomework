require 'singleton'
require 'sqlite3'
require 'byebug'

class QuestionsDatabase < SQLite3::Database
  include Singleton
  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end







class Question

  attr_accessor :id, :title, :body, :author_id

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def self.find_by_id(id)
    id_finder = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return nil if id_finder.empty?
    # debugger
    Question.new(id_finder.first)
  end

  def self.find_by_author_id(author_id)
    author_id_finder = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    return nil if author_id_finder.empty?
    # debugger
    author_id_finder.map { |question| Question.new(question) }
  end

  def self.find_by_title(title)
    title_finder = QuestionsDatabase.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        questions
      WHERE
        title = ?
    SQL
    return nil if title_finder.empty?
    Question.new(title_finder.first)
  end

  def author
    author_of_question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil if author_of_question.empty?
    User.new(author_of_question.first)
  end

  def replies
    Reply.find_by_question_id(@id)
  end
end







class Reply
  attr_accessor :id, :question_id, :parent_id, :body, :author_id

  def initialize(options)
    @id = options['id']
    @question_id = options['title']
    @parent_id = options['parent_id']
    @author_id = options['author_id']
    @body = options['body']
  end

  def self.find_by_id(id)
    id_finder = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil if id_finder.empty?

    Reply.new(id_finder.first)
  end

  # SAME AS user_id referenced in exercise directions
  def self.find_by_author_id(author_id)
    author_id_finder = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        replies
      WHERE
        author_id = ?
    SQL
    return nil if author_id_finder.empty?
    # debugger
    author_id_finder.map { |question| Reply.new(question) }
  end

  def self.find_by_question_id(question_id)
    question_id_finder = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    return nil if question_id_finder.empty?
    # debugger
    question_id_finder.map { |question| Reply.new(question) }
  end

  def author
    author_of_question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil if author_of_question.empty?
    User.new(author_of_question.first)
  end

  def question
    question_finder = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return nil if question_finder.empty?
    Question.new(question_finder.first)
  end

  def parent_reply
    Reply.find_by_id(@parent_id)
  end

  def child_replies
    # Reply.find_by_id(@id)
    child_finder = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = ?
    SQL
    return nil if child_finder.empty?

    Question.new(child_finder.first)
  end
end







class User
  attr_accessor :id, :fname, :lname

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def self.find_by_name(fname, lname)
    find_name = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND
        lname = ?
    SQL
    return nil if find_name.empty?

    User.new(find_name.first)
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_author_id(@id)
  end

end

x = User.find_by_name("Rarah", "Giauj")
y = Question.find_by_author_id(x.id)
a = y.first.replies
p a.first.parent_reply
