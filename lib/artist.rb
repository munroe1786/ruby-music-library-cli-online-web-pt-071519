class Artist 
  
  attr_accessor :name, :songs
  
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
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
  
  def songs
   Song.all.each { |song| song.artist == self}
  end
  
  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end
  
  def genres 
    songs.map do |song| song.genre
  end
  end
end