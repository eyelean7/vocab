require('rspec')
require('words')

describe(Entry) do
  describe('#headword') do
    it('returns the word') do
      test_entry = Entry.new({:headword => "defenestrate"})
      expect(test_entry.headword()).to(eq("defenestrate"))
    end
  end
  describe('#definition') do
    it('returns the definition') do
      test_definition = "to throw out of a window"
      test_entry = Entry.new({:headword => "defenestrate"})
      test_entry.add_definition(test_definition)
      expect(test_entry.definitions()).to(eq(["to throw out of a window"]))
    end
  end
end
