class Brazilian < User
  TOTAL_PEOPLE_TO_SHOW = 27

  scope :reverse,     -> { order('created_at DESC') }
  scope :recent,      -> { limit(TOTAL_PEOPLE_TO_SHOW).reverse }
  scope :with_photo,  -> { where('photo_url IS NOT NULL') }
  scope :entire_list, -> { select([:id, :name, :location, :photo_url]).with_photo.reverse }

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
