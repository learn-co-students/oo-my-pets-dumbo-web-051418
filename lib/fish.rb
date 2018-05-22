class Fish

  attr_accessor :mood, :owner
  attr_reader :name

  def initialize(name)
    @name = name
    @mood = 'nervous'
  end
end
