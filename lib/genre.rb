class Genre 

  extend Concerns::Findable
  
  attr_accessor :name 

  attr_reader :songs
  
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
    new(name).save
  end
  
  def self.destroy_all
    @@all.clear
  end

  def add_song(song)
    song.genre = self unless song.genre
    @songs << song unless @songs.include?(song)
  end

  def artists 
    songs.collect {|song| song.artist}.uniq
  end

end
