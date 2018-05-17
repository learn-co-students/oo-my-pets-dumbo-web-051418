require 'pry'
class Owner
  # code goes here
  attr_reader :species
  attr_accessor :name, :pets

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {
      fishes: [],
      dogs: [],
      cats: []
    }
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.count
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end

  def walk_dogs
    for dog in @pets[:dogs]
      dog.mood = "happy"
    end
  end

  def play_with_cats
    for cat in @pets[:cats]
      cat.mood = "happy"
    end
  end

  def feed_fish
    for fish in @pets[:fishes]
      fish.mood = "happy"
    end
  end

  def reset_pets
    @pets.clear
  end

  def sell_pets
    pets = @pets.values.flatten
    # binding.pry
    for pet in pets
      pet.mood = "nervous"
    end
    reset_pets
  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end

end
