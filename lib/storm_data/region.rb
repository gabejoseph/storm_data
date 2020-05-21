class StormData::Region

    @@all = []
    attr_accessor :name, :url

    def initialize(name, url) 
        @name = name
        @url = url
        save
    end 

    def self.find_by_name(userinput)
        if @@all.include?{|x| x.name == userinput}
            return x
        end
    end 

    def save 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 


end 