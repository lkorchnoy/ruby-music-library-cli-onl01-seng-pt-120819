class MusicImporter
attr_reader :path

  def initialize(path)
    @path = path
  end
  
  def files
    Dir.entries(@path).grep(/.mp3/)
  end
  
  def import
   self.files.each{|file| Song.create_from_filename(file)}
  end   
  
end


# @files ||= Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/", "")}