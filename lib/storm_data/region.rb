class StormData::Region

    @@all = []
    attr_accessor :name, :url

    def initialize(name, url) 
        @name = name
        @url = url
        save
    end 

    def save 
        @@all < self 
    end 

    def self.all 
        @@all 
    end 


end 