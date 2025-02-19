class Owner
  @@all = []
  attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = 'human'
    save
  end

  def say_species
    "I am a #{@species}."
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    change_mood(dogs, 'happy')
  end

  def feed_cats
    change_mood(cats, 'happy')
  end

  def sell_pets
    pets = dogs + cats
    change_mood(pets, 'nervous') 
    pets.each {|pet| pet.owner = nil}
  end
  
  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

  def change_mood(animals, mood)
    animals.each {|animal| animal.mood = mood}
  end

  def save
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
end

