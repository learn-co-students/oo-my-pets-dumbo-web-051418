require 'pry'

class Owner
  # code goes here
  @@all = []

  attr_reader :species
  attr_accessor :name, :pets

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    self.all.size
  end

  def initialize (species)
    @species = species
    @@all << self
    @pets = {
      :fishes => [],
      :dogs => [],
      :cats => []
    }

  end

  def say_species
    return "I am a #{self.species}."
  end

  def pets
    @pets
  end

  def buy_fish(name)
    self.pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    self.pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    self.pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    self.pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    self.pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    self.pets.each do |type, pets|
      pets.each do |pet|
        pet.mood = "nervous"
      end
      pets.clear
    end
  end

  def list_pets
    return "I have #{self.pets[:fishes].size} fish, #{self.pets[:dogs].size} dog(s), and #{self.pets[:cats].size} cat(s)."
  end


end
