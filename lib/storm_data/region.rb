class StormData::Region

    @@all = []
    attr_accessor :name, :prelim, :supp

    def initialize(name)
        @name = name 
        @prelim = prelim
        @supp = supp
        StormData::Scraper.scrape(self) #["Disturbances:", "None", "Tropical Weather Discussion"]
        save
    end

    def self.find_by_name(userinput)
        returnvalue = self.all.find{|x| x.name == userinput}
        returnvalue
    end 

    def save 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def self.clear
        @@all.clear
    end 
    
end 