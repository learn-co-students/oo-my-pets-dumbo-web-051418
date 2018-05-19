require 'pry'
class Owner
  attr_reader :species
  attr_accessor :name, :pets
  @@all = []
  def initialize owner_name
    @name = owner_name
    @species = "human"
    @pets = {fishes: [], cats: [], dogs: []}
    @@all << self
  end
  def self.all
    @@all
  end
  def self.count
    @@all.length
  end
  def self.reset_all
    @@all.clear
  end
  def say_species
    "I am a #{self.species}."
  end
  def buy_fish fish_name
    new_fish = Fish.new(fish_name)
    new_fish.owner = self
    self.pets[:fishes] << new_fish
  end
  def buy_cat cat_name
    new_cat = Cat.new(cat_name)
    new_cat.owner = self
    self.pets[:cats] << new_cat
  end
  def buy_dog dog_name
    new_dog = Dog.new(dog_name)
    new_dog.owner = self
    self.pets[:dogs] << new_dog
  end
  def walk_dogs
    self.pets[:dogs].map do |dog|
      dog.mood = "happy"
    end
  end
  def play_with_cats
    self.pets[:cats].map do |cat|
      cat.mood = "happy"
    end
  end
  def feed_fish
    self.pets[:fishes].map do |fish|
      fish.mood = "happy"
    end
  end
  def sell_pets
    self.pets.map do |pet_type, pet_array|
      pet_array.map do |pet_name|
        pet_name.mood = "nervous"
      end
      pet_array.clear
    end
  end
  def list_pets
    "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
  end
end
