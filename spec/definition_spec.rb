require('rspec')
require('word')
require('definition')

describe('.definition') do

  before(:each) do
    Word.clear
    Definition.clear
    @word1 = Word.new('trick', nil)
    @word2 = Word.new('text', nil)
    @word1.save
    @word2.save
  end

  describe ('#==') do
    it('two definitions are the same if they have the same string def and word association') do
      definition1 = Definition.new("deceive", @word1.id, nil)
      definition2 = Definition.new("deceive", @word1.id, nil)
      expect(definition1).to(eq(definition2))
    end
  end

  describe('.all') do
    it('returns all defintions') do
      definition1 = Definition.new("deceive", @word1.id, nil)
      definition1.save()
      definition2 = Definition.new("deceive", @word1.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition1, definition2]))
    end
  end

  describe('.save') do
    it('saves a definition for a given word_id') do
      definition1 = Definition.new("deceive", @word1.id, nil)
      definition1.save()
      expect(Definition.all).to(eq([definition1]))
    end
  end

  describe('.clear') do
    it('clears all definitions for a given word_id') do
      definition1 = Definition.new("deceive", @word1.id, nil)
      definition1.save()
      Definition.clear
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.find') do
    it('finds a defintion by id') do
      definition1 = Definition.new("deceive", @word1.id, nil)
      definition1.save()
      definition2 = Definition.new("dodge", @word1.id, nil)
      definition2.save()
      expect(Definition.find(definition1.id)).to(eq(definition1))
    end
  end

  describe('#update') do
    it('updates a definition by id') do
      definition1 = Definition.new("deceive", @word1.id, nil)
      definition1.save()
      definition1.update("hoax", @word1.id)
      expect(definition1.defi).to(eq("hoax"))
    end
  end

  describe('#delete') do
    it('deletes a definition by id') do
      definition1 = Definition.new("deceive", @word1.id, nil)
      definition1.save()
      definition2 = Definition.new("dodge", @word1.id, nil)
      definition2.save()
      definition1.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end

  describe('.find_by_word') do
    it('find all definitions to a word') do
      @word1 = Word.new('trick', nil)
      @word1.save
      word2 = Word.new('lie', nil)
      word2.save
      definition1 = Definition.new("deceive", @word1.id, nil)
      definition1.save()
      definition2 = Definition.new("prevaricate", word2.id, nil)
      definition2.save()
      expect(Definition.find_by_word(word2.id)).to(eq([definition2]))
    end
  end
end
