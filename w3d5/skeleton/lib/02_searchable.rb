require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_line, value_line = [], []
    params.each do |att, val|
      if columns.include?(att)
        where_line << "#{att} = ?"
        value_line << val
      end
    end
    return where_line if where_line.empty?
    where_line = where_line.join(" AND ")
    result = DBConnection.execute(<<-SQL, *value_line)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{where_line}
    SQL
    parse_all(result)
  end
end

class SQLObject
  extend Searchable
end
