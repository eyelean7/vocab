require('rspec')
require('words')

describe(Entry) do
  test_definition = Definition.new({:definition => "to throw out of a window"})
  test_entry = Entry.new({:headword => "defenestrate"})
  test_entry.add_definition(test_definition)
  describe('attr_reader') do
    it('returns attributes when called') do
      expect(test_entry.headword()).to(eq("defenestrate"))
      expect(test_entry.definitions()).to(eq(["to throw out of a window"]))
      expect(test_entry.id()).to(eq(1))
    end
  end
  describe('.all') do
    it('starts empty') do
      expect(Entry.all()).to(eq([]))
    end
  end
  describe('.find') do
    it('returns an object with a given id') do
      test_entry.save()
      expect(Entry.find(test_entry.id())).to(eq(test_entry))
    end
  end
  describe('#add_definition') do
    it('allows multiple definitions') do
      test_definition2 = Definition.new({:definition => "to give away money"})
      test_entry.add_definition(test_definition2)
      expect(test_entry.definitions()).to(eq(["to throw out of a window", "to give away money"]))
    end
  end
end
