class Owner
  attr_reader :species
  attr_accessor :name, :pets

  @@owners = []
  def initialize(species, name=nil)
    @species = species
    @name = name
    @pets = {:fishes => [], :dogs => [], :cats => []}

    @@owners << self
  end

  def species
    @species
  end

  def say_species
    "I am a #{@species}."
  end

  def name
    @name
  end

  def pets
    @pets
  end

  def buy_fish(new_fish)
    fish = Fish.new(new_fish)
    @pets[:fishes] << fish
  end

  def buy_cat(new_cat)
    cat = Cat.new(new_cat)
    @pets[:cats] << cat
  end

  def buy_dog(new_dog)
    dog = Dog.new(new_dog)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |key, value|
      value.each do |pet|
        pet.mood = "nervous"
      end
    end
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end

  def self.all
    @@owners
  end

  def self.count
    @@owners.length
  end

  def self.reset_all
    @@owners = []
  end

end
