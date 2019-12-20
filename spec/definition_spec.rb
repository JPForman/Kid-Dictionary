require('rspec')
require('word')
require('definition')

describe('.definition') do

  before(:each) do
    # Word.clear
    # Definition.clear
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
end
