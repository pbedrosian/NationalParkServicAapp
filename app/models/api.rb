class API < ActiveRecord::Base
    @@all_parks = []
    def self.info(state)
        api_key = 'IK5zqTLCBrBr2Bgk6ozJEmaSl2xEnHUhKzuGdzzW'
        url = "https://developer.nps.gov/api/v1/parks?stateCode=#{state}&api_key=#{api_key}" 
        info = HTTParty.get(url)
        park = info["data"].map {|n| n["fullName"]}
        @@all_parks << park
    end

    def self.clear_parks
        @@all_parks.clear
    end
end