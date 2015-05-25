require 'httparty'

class CurrentAlert

  def initialize(zip)
    @alert = get_data
  end

  def get_alert
    array = @alert["alerts"]

    if array == []
      puts "There are no current alerts for your area."
    else
      array.each do |d|
        puts "ALERT: #{d["description"]}"
        puts "Expires on: #{d["expires"]}"
        puts ""
      end
    end
  end

  private def get_data
    HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/alerts/q/#{zip}.json")
  end

end

# #Output display
# #TO DELETE
# a = CurrentAlert.new(76301)
# a.get_alert
