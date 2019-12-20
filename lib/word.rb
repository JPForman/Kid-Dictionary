class Word

  @@dictionary = {}
  @@total_rows = 0

  attr_reader :id, :name

  def initialize (name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  def self.all()
    @@dictionary.values
  end

  def save()
    @@dictionary[self.id] = Word.new(self.name, self.id)
  end

  def ==(other_word)
    self.name.eql?(other_word.name)
  end

  def self.clear
    @@dictionary = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@dictionary[id]
  end

  def update(name)
    @name = (name == "") ? self.name : name
  end

  def delete
    @@dictionary.delete(self.id)
  end

end
