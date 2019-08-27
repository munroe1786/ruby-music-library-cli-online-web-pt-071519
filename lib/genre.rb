class Genre 
  
  attr_accessor :name 
  
  @@all = [ ]
  
  def initialize(name)
    @name = name
    @songs = [ ]
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
    self
  end
  
  def self.create(name)
    genre = Genre.new(name)
    @@all << genre
    genre
  end
  
  def self.destroy_all
    self.all.clear
  end

end