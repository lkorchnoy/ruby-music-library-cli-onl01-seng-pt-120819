require_relative './concerns/findable.rb'

class Artist
  extend Concerns::Findable
   @@all = []

attr_accessor :name, :songs

def initialize(name)
@name = name
@songs = []
end

def self.all
@@all
end

def self.destroy_all
@@all.clear
end

def self.create
self.new.save
end

def add_song(song)
  @songs << song unless @songs.include?(song)
  song.artist = self
  #song.artist = self unless song.artist == self
end

def genres
  self.songs.collect{|s| s.genre}.uniq
end

def save
@@all << self
end




end
