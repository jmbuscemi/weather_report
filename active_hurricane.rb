require 'httparty'

class ActiveHurricane

  def initialize
    @hurricane = get_data["currenthurricane"]
  end

  # def name
  #   return "There are currently no hurricanes." if @hurricane == []
  #   # self.no_hurricanes?
  #   output = @hurricane.map {|item| "Hurricane Name: #{item["stormInfo"]["stormName_Nice"]}"}
  # end
  #
  # def category
  #   return "There are currently no hurricanes." if @hurricane == []
  #   # self.no_hurricanes?
  #   output = @hurricane.map do |item|
  #     "Category: #{item["Current"]["SaffirSimpsonCategory"]} (#{item["Current"]["Category"]})"
  #   end
  # end
  #
  # def sustained_winds
  #   return "There are currently no hurricanes." if @hurricane == []
  #   # self.no_hurricanes?
  #   output = @hurricane.map do |item|
  #     "Sustained Winds: #{item["Current"]["WindSpeed"]["Mph"]}mph"
  #   end
  # end
  #
  # def wind_gust
  #   return "There are currently no hurricanes." if @hurricane == []
  #   # self.no_hurricanes?
  #   output = @hurricane.map do |item|
  #     "Max Wind Gust: #{item["Current"]["WindGust"]["Mph"]}mph" unless item["Current"]["WindGust"]["Mph"] == "null"
  #   end
  # end
  #
  # def latitude
  #   return "There are currently no hurricanes." if @hurricane == []
  #   # self.no_hurricanes?
  #   output = @hurricane.map do |item|
  #     if item["Current"]["lat"] < 0
  #       "Location: #{item["Current"]["lat"]*(-1)}deg S"
  #     else
  #       "Location: #{item["Current"]["lat"]}deg N"
  #     end
  #   end
  # end
  #
  # def longtitude
  #   return "There are currently no hurricanes." if @hurricane == []
  #   # self.no_hurricanes?
  #   output = @hurricane.map do |item|
  #     if item["Current"]["lon"] < 0
  #       "Location: #{item["Current"]["lon"]*(-1)}deg W"
  #     else
  #       "Location: #{item["Current"]["lon"]}deg E"
  #     end
  #   end
  # end

  def get_hurricane
    # array = []
    # array = @hurricane["currenthurricane"]

    if @hurricane == []
      puts "There are currently no hurricanes."
      storm_name = "NONE"
    else
      output = @hurricane.map do |item|
        puts "Hurricane Name: #{item["stormInfo"]["stormName_Nice"]}"
        puts "Category: #{item["Current"]["SaffirSimpsonCategory"]} (#{item["Current"]["Category"]})"
        puts "Sustained Winds: #{item["Current"]["WindSpeed"]["Mph"]}mph"
        unless item["Current"]["WindGust"]["Mph"] == "null"
          puts "Max Wind Gust: #{item["Current"]["WindGust"]["Mph"]}mph"
        end
        if item["Current"]["lat"] < 0
          puts "Location: #{item["Current"]["lat"]*(-1)}deg S"
        else
          puts "Location: #{item["Current"]["lat"]}deg N"
        end
        if item["Current"]["lon"] < 0
          puts "Location: #{item["Current"]["lon"]*(-1)}deg W"
        else
          puts "Location: #{item["Current"]["lon"]}deg E"
        end
        puts "Movement: #{item["Current"]["Movement"]["Text"]} @ #{item["Current"]["Fspeed"]["Mph"]}mph"
      storm_name = "#{item["stormInfo"]["stormName_Nice"]}"
      end
    end
    storm_name
  end

  private def get_data
    HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/currenthurricane/view.json")
  end
end
