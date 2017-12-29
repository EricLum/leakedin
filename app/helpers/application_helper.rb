module ApplicationHelper

  def google_maps(latitude, longitude)
    # "https://maps.googleapis.com/maps/api/staticmap?&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7C%7C#{latitude},#{longitude}key=AIzaSyDGvgS-p6cR5loLAz3OVlo6sutDlQ8Bz1A"

  "https://maps.googleapis.com/maps/api/staticmap?&zoom=15&size=200x200&maptype=roadmap&markers=color:red%7C%7C#{latitude},#{longitude}&key=#{ENV['SUPER_SECRET_KEY']}"
  end
end
