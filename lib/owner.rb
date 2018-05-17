require 'pry'
class Owner
  attr_accessor :pets, :name, :mood
  attr_reader :species 
  @@all = [] 
  def initialize(species)
    @species = species
    @pets = {"fishes":[], "cats": [], "dogs": []}
    @@all << self 
  end
  
  def self.all 
    @@all 
  end
  
  def self.count 
    @@all.size 
  end 
  
  def self.reset_all 
    @@all.clear 
  end 
  
  
  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name) 
    fish = Fish.new(name) 
    @pets[:fishes] << fish 
  end
  
  def buy_cat(name) 
    cat = Cat.new(name) 
    @pets[:cats] << cat
  end
  
  def buy_dog(name) 
    dog = Dog.new(name) 
    @pets[:dogs] << dog
  end
  
  def walk_dogs
    @pets[:dogs].map {|dog| dog.mood = "happy"} 
  end 
  
  def play_with_cats
    @pets[:cats].map {|cat| cat.mood = "happy"}
  end 
  
  def feed_fish
    @pets[:fishes].map {|fish| fish.mood = "happy"}
  end 
  
  def sell_pets
    @pets.each do |type, all_pets_of_type|  
      all_pets_of_type.map {|pet| pet.mood = "nervous"} 
    end 
    @pets.clear 
  end 
  
  def list_pets
    dog_count = @pets[:dogs].length
    cat_count = @pets[:cats].length
    fish_count = @pets[:fishes].length 
    
    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end 
  
  
end