class Word

  @@words = {}
  @@total_rows = 0

  attr_reader :id, :name

  def initialize (name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  def self.all()
    @@words.values
  end

  def save()
    @@words[self.id] = Word.new(self.name, self.id)
  end

  def ==(other_word)
    self.name.eql?(other_word.name)
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end



end
