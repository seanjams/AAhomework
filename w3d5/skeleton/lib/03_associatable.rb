require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    # ...
  end

  def table_name
    # ...
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    name = name.singularize.downcase
    defaults = {primary_key: :id,
                foreign_key: "#{name}_id".to_sym,
                class_name: name.camelcase}
    @options = defaults.merge(options)
  end

  def foreign_key
    @options[:foreign_key]
  end

  def primary_key
    @options[:primary_key]
  end

  def class_name
    @options[:class_name]
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    name = name.singularize.downcase
    self_class_name = self_class_name.singularize.downcase
    defaults = {primary_key: :id,
                foreign_key: "#{self_class_name}_id".to_sym,
                class_name: name.camelcase}
    @options = defaults.merge(options)
  end

  def foreign_key
    @options[:foreign_key]
  end

  def primary_key
    @options[:primary_key]
  end

  def class_name
    @options[:class_name]
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    # ...
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
end
