class Brazilian < User
  TOTAL_PEOPLE_TO_SHOW = 27

  scope :reverse,    -> { order('created_at DESC') }
  scope :recent,     -> { limit(TOTAL_PEOPLE_TO_SHOW).reverse }
  scope :with_photo, -> { where('photo_url IS NOT NULL') }

  def self.total_other_people
    self.with_photo.count - TOTAL_PEOPLE_TO_SHOW
  end

  def self.entire_list_in_json
    self.with_photo.reverse.to_json(methods: :who_is, only: :photo_url)
  end

  def first_name
    name.split.first
  end

  def who_is
    [name, location].reject{ |v| v.blank? }.join(' - ')
  end
end
