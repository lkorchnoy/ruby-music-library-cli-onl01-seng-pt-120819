class MusicLibraryController
  
  def initialize(path = "./db/mp3s/")
    MusicImporter.new(path)
    end
    
    def call
    end
      
end