
require 'pry'

class Owner
  @@all = []

  attr_reader :species
  attr_accessor :name, :pets

  def initialize(species)
    @species = species
    @pets = {:cats => [],
             :dogs => [],
             :fishes => []
            }

    @@all << self
  end

  # OWNER METHODS
  # ----------
  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  # INSTANCE METHODS
  # ----------
  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(fish_name)
    new_fish = Fish.new(fish_name)
    self.pets[:fishes] << new_fish
  end

  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name)
    self.pets[:cats] << new_cat
  end

  def buy_dog(dog_name)
    new_dog = Dog.new(dog_name)
    self.pets[:dogs] << new_dog
  end

  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood = "happy" }
  end

  def play_with_cats
    @pets[:cats].each {|cat| cat.mood = "happy" }
  end

  def feed_fish
    @pets[:fishes].each {|fish| fish.mood = "happy" }
  end

  def sell_pets
    # @pets.keys.each {|pet| pet.mood = "nervous" }end
    @pets.each do |key, value|
      value.each do |pet|
        pet.mood = 'nervous'
      end
    end
    clear_out
  end


  def clear_out
    @pets = {:cats => [],
             :dogs => [],
             :fishes => []
            }
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end

end

#
