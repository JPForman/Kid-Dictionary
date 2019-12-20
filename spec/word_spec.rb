require('rspec')
require('word')

describe('.word') do

  before(:each) do
    @word1 = Word.new('trick', nil)
    @word2 = Word.new('text', nil)
    @word1.save
    @word2.save
  end

  after(:each) do
    Word.clear
  end

  describe ('#==') do
    it('two words are equal if they have the same name') do
      word3 = Word.new('trick', nil)
      expect(@word1).to(eq(word3))
    end
  end

end
