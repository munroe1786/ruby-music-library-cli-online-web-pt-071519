class Song 
  
  attr_accessor :name
  
  attr_reader :artist, :genre
  
  @@all = [ ]
  
  def initialize(name, artist= nil, genre= nil)
    @name = name
    @artist = artist
    @genre = genre
  end
  
  def self.all 
    @@all
  end
  
  def save
    @@all << self
    self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
  
  def artist=(artist)
    self.artist = artist
    #artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
  end
  
  def self.find_or_create_by_name(name)
    self.find(name) || self.new(name)
  end
  
  def self.find(name)
    @@all.find { |artist| artist.name == name}
  end
  
end