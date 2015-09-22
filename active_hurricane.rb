require 'httparty'

class ActiveHurricane

  def initialize
    @hurricane = get_data["currenthurricane"]
  end

  def display
    array = []
    string = ""
    return "There are currently no hurricanes." if @hurricane == []
    @hurricane.each do |item|
      name =  "Hurricane Name: #{item["stormInfo"]["stormName_Nice"]}" + "\n"
      category = "Category: #{item["Current"]["SaffirSimpsonCategory"]} (#{item["Current"]["Category"]})" + "\n"
      sustained = "Sustained Winds: #{item["Current"]["WindSpeed"]["Mph"]}mph" + "\n"
      unless item["Current"]["WindGust"]["Mph"] == "null"
        gust = "Max Wind Gust: #{item["Current"]["WindGust"]["Mph"]}mph" + "\n"
      end
      if item["Current"]["lat"] < 0
        lat = "Location: #{item["Current"]["lat"]*(-1)}deg S" + "\n"
      else
        lat = "Location: #{item["Current"]["lat"]}deg N"+"\n"
      end
      if item["Current"]["lon"] < 0
        lon = "Location: #{item["Current"]["lon"]*(-1)}deg W" + "\n"
      else
        lon = "Location: #{item["Current"]["lon"]}deg E" + "\n"
      end
      string = name + category + sustained + gust + lat + lon + "\n"
      array << string
    end
    array
  end

  private
    def get_data
      HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/currenthurricane/view.json")
    end
end
