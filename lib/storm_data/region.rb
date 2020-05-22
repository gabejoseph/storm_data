class StormData::Region

    @@all = []
    attr_accessor :name, :url, :prelim, :supp

    def initialize(name)
        @name = name 
        @url = url
        @prelim = prelim
        @supp = supp
        x = StormData::Scraper.scrape_prelim(self)
        binding.pry
        save
    end

    def self.extra(userinput)
        #calls scraper and fixes data to self
        #puts extra data
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