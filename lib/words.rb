class Entry
  attr_reader(:headword, :definitions)
  define_method(:initialize) do |attributes|
    @headword = attributes[:headword]
    @definitions =[]
  end
  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end
end

class Definitions
  attr_reader(:definition)
  define_method(:initialize) do |attributes|
    @definition = attributes[:definition]
  end
end
