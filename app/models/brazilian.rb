class Brazilian < User
  def location
    [city, region, country].reject { |v| v.blank? }.join(' - ')
  end
end
