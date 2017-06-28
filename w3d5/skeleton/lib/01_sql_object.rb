require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    @columns = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL
    .first.map(&:to_sym)
  end

  def self.finalize!
    columns.each do |column|
      define_method(column) { attributes[column] }
      define_method("#{column}=") { |val| attributes[column] = val }
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.tableize
  end

  def self.all
    result = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL
    parse_all(result)
  end

  def self.parse_all(results)
    results.map { |options| self.new(options) }
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        id = ?
    SQL
    result.empty? ? nil: self.new(result.first)
  end

  def initialize(params = {})
    params.each do |att, val|
      att = att.to_sym
      if self.class.columns.include?(att)
        self.send("#{att}=", val)
      else
        raise "unknown attribute '#{att}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map { |attr| self.send(attr) }
  end

  def insert
    cols = self.class.columns[1..-1]
    col_names = cols.join(", ")
    wild_cards = (["?"] * cols.length).join(", ")
    DBConnection.execute(<<-SQL, *attribute_values[1..-1])
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{wild_cards})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    set_string = []
    cols = self.class.columns
    (0...attribute_values.length).each do |i|
      set_string << "#{cols[i]} = ?"
    end
    set_string = set_string.join(", ")
    DBConnection.execute(<<-SQL, *attribute_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_string}
      WHERE
        #{self.class.table_name}.id = ?
    SQL
  end

  def save
    id.nil? ? insert : update
  end
end
