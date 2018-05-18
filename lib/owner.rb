require 'pry'
class Owner
  attr_accessor :name, :pets
  attr_reader :species

  @@all = Array.new

  def initialize(species)
    @species = species
    @@all.push(self)
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def pets
    @pets == nil ? (@pets = { fishes: [], dogs: [], cats: [] }) : @pets
  end

  def buy_fish(name)
    fish = Fish.new(name)
    # RSpec failure messages kept popping up, thus needed double checking
    @pets == nil ? (@pets = self.pets) : nil
    @pets[:fishes].push(fish)
  end

  def buy_cat(name)
    cat = Cat.new(name)
    # RSpec failure messages kept popping up, thus needed double checking
    @pets == nil ? (@pets = self.pets) : nil
    @pets[:cats].push(cat)
  end

  def buy_dog(name)
    dog = Dog.new(name)
    # RSpec failure messages kept popping up, thus needed double checking
    @pets == nil ? (@pets = self.pets) : nil
    @pets[:dogs].push(dog)
  end

  def walk_dogs
    @pets[:dogs].each { |dog| dog.mood = "happy" }
  end

  def play_with_cats
    @pets[:cats].each { |cat| cat.mood = "happy" }
  end

  def feed_fish
    @pets[:fishes].each { |fish| fish.mood = "happy" }
  end

  def sell_pets
    @pets.each do |animal|
      # 0th element is the name, 1st element are the array of those animals
      animal[1].each do |pet|
        pet.mood = "nervous"
      end
    end
    @pets.clear
  end

  def list_pets
    # 0th element is the name, 1st element are the array of those animals
    # in the animal array notation below

    number_of_pets = @pets.collect { |animal|
      animal_name = animal[0].to_s
      case animal_name
      when "fishes"
        animal_name = animal_name[0..3]
      else
        animal_name = animal_name[0..2] + "(s)"
      end
      [animal_name, animal[1].count]
    }

    message = "I have " #quantity is aptly named

    number_of_pets.each_with_index do |animal, index|
      if index != number_of_pets.length - 1
        message = "#{message}#{animal[1]} #{animal[0]}, "
      else
        message = "#{message}and #{animal[1]} #{animal[0]}."
      end
    end

    message
  end
end
