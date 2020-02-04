require_relative './concerns/findable'

class Genre
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

def artists
  self.songs.collect{|s| s.artist}.uniq
end

def save
   @@all << self
end

end
