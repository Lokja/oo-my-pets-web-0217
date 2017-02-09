class Owner
  
  attr_reader :species
  attr_accessor :name, :pets

  @@owners = []

  def initialize(name)
    @name = name
    @pets = {fishes: [], cats: [], dogs: []}
    @@owners << self
    @species = "human"
  end

  def buy_fish(name)
    fish = Fish.new(name)
    fish.owner = self
    self.pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    cat.owner = self
    self.pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    dog.owner = self
    self.pets[:dogs] << dog
  end

  def self.reset_all
    @@owners.clear
  end

  def self.count
    @@owners.count
  end

  def self.all
    @@owners
  end

  def say_species
    "I am a #{@species}."
  end

  def walk_dogs
    self.pets[:dogs].each{|pet| pet.mood = "happy"}
  end

  def play_with_cats
    self.pets[:cats].each{|pet| pet.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].each{|pet| pet.mood = "happy"}
  end

  def sell_pets
    self.pets.each do |type, array|
      array.each do |pet|
        pet.mood = "nervous"
      end
      array.clear
    end
  end

  def list_pets
    num_fish = self.pets[:fishes].count
    num_cats = self.pets[:cats].count
    num_dogs = self.pets[:dogs].count
    "I have #{num_fish} fish, #{num_dogs} dog(s), and #{num_cats} cat(s)."
  end

end
