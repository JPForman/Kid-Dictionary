class Definition

  attr_reader :id
  attr_accessor :defi, :word_id

  @@defi = {}
  @@total_rows = 0

  def initialize(defi, word_id, id)
    @defi = defi
    @word_id = word_id
    @id = id || @@total_rows += 1
  end

  def ==(defi_to_compare)
    ((self.defi() == defi_to_compare.defi()) && (self.word_id() == defi_to_compare.word_id()))
  end

  def self.all()
    @@defi.values()
  end

  def self.clear
    @@defi = {}
    @@total_rows = 0
  end

  def save()
    @@defi[self.id] = Definition.new(self.defi, self.word_id, self.id)
  end

  def self.find(id)
    @@defi[id]
  end

  def update(defi, word_id)
    self.defi = defi
    self.word_id = word_id
    @@defi[self.id] = Definition.new(self.defi, self.word_id, self.id)
  end


end
