class Entry
  @@all_entries = []
  attr_reader(:headword, :definitions, :id)
  define_method(:initialize) do |attributes|
    @headword = attributes[:headword]
    @definitions =[]
    @id = @@all_entries.length() + 1
  end
  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end
  define_method(:save) do
    @@all_entries.push(self)
  end
  define_singleton_method(:all) do
    @@all_entries
  end
  define_singleton_method(:find) do |identification|
    found_word = nil
    @@all_entries.each() do |entry|
      if entry.id() == identification.to_i()
        found_word = entry
      end
    end
    found_word
  end
end

class Definitions
  attr_reader(:definition)
  define_method(:initialize) do |attributes|
    @definition = attributes[:definition]
  end
end
