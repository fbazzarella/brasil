class Brazilian < User
  TOTAL_PEOPLE_TO_SHOW = 30

  scope :recent,     -> { order('created_at DESC').limit(TOTAL_PEOPLE_TO_SHOW) }
  scope :with_photo, -> { where('photo_url IS NOT NULL') }

  def self.total_other_people
    self.with_photo.count - TOTAL_PEOPLE_TO_SHOW
  end

  def first_name
    name.split.first
  end

  def who_is
    [name, location].reject{ |v| v.blank? }.join(' - ')
  end
end
