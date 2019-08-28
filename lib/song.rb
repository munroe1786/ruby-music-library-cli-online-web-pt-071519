require 'pry'

class Song 

  extend Concerns::Findable
  
  attr_accessor :name
  
  attr_reader :artist, :genre
  
  @@all = [ ]
  
  def initialize(name, artist= nil, genre= nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end
  
  def self.all 
    @@all
  end
  
  def save
    @@all << self
    self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    new(name).save
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self) if artist
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) if genre
  end

  def self.new_from_filename(file)
    song_name = file.split(' - ')[1]
    artist_name = file.split(' - ')[0]
    song_genre = file.split(' - ')[2].chomp(".mp3")
    artist_name = Artist.find_or_create_by_name(artist_name)
    song_genre = Genre.find_or_create_by_name(song_genre)
    new(song_name, artist_name, song_genre)
  end

  def self.create_from_filename(file)
    new_from_filename(file).save
  end

  #def self.find_by_name(name)
    #self.all.find {|song| song.name == name}
  #end

  #def self.find_or_create_by_name(name)
    #self.find_by_name(name) or self.create(name)
  #end
end