class Song
   attr_accessor :name, :artist, :genre
   @@all = []

def initialize(name, artist = nil, genre = nil)
@name = name
self.artist = artist if artist
self.genre = genre if genre
end

def self.destroy_all
self.all.clear
end

def self.create
self.new.save
end

def self.all
@@all
end

def self.find_by_name(name)
  self.all.detect{|s| s.name == name}
end

def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create(name)
end

def self.new_by_filename(file)
    song_parts = file.split(" - ")
    artist_name = song_parts[0]
    song_name = song_parts[1]
    genre_name = song_parts[2]
    
    
    artist = Artist.find_or_create_by_name(artist_name)
     genre = Genre.find_or_create_by_name(genre_name)
     self.new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
     new_from_filename(filename).tap{ |s| s.save }
   end

  def save
  @@all << self
   end

end


  

#    def self.find_or_create_by_name(name)
  #  self.find(name) ? self.find(name) : self.create(name)
 #    end
 
 # def self.create(name)
 #  self.new(name).tap {|song| song.save}
 # end




#def self.create(name)
 #   song = self.new(name)
   # song
  # end  



 # def files
  #  Dir.entries(@path).grep(/.mp3/)
    # alternate way
    # @files = Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
  # end  
  # def import
  # self.files.each{|file| Song.new_by_filename(file)}
  # end   
#end  

#the files in the directory we are looking at is being passed in #through @path and .grep method helps filter out the .mp3 part.
#We then use this files method inside of the import method to send #these files to the Song class via the Song.new_by_filename 
