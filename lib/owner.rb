require 'pry'

class Owner

  
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def self.all
    @@all
  end

  def say_species
    "I am a human."
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name)
    new_cat.owner = self
  end

  def buy_dog(dog_name)
    new_dog = Dog.new(dog_name)
    new_dog.owner = self
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.each do |dog|
        dog.owner = nil
        dog.mood = "nervous"
    end
    self.cats.each do |cat|
        cat.owner = nil
        cat.mood = "nervous"
      end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end