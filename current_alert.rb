require 'httparty'

class CurrentAlert

  def initialize(zip)
    @alert = HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/alerts/q/#{zip}.json")
  end

  def get_alert
    alert_array = @alert["alerts"]

    if alert_array == []
      puts "There are no current alerts for your area."
    else
      alert_array.each do |d|
        puts "ALERT: #{d["description"]}"
        puts "Expires on: #{d["expires"]}"
        puts ""
      end
    end
  end

end

# #Output display
# #TO DELETE
# a = CurrentAlert.new(76301)
# a.get_alert
