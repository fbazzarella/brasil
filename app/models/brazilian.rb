class Brazilian < User
  TOTAL_PEOPLE_TO_SHOW = 27

  scope :reverse,    -> { order('created_at DESC') }
  scope :with_photo, -> { where('photo_url IS NOT NULL') }
  scope :recent,     -> { limit(TOTAL_PEOPLE_TO_SHOW).reverse }

  class << self
    def total_other_people
      with_photo.count - TOTAL_PEOPLE_TO_SHOW
    end

    def entire_list_in_json
      with_photo.reverse.to_json(methods: [:first_name, :who_is], only: :photo_url)
    end
  end

  def first_name
    name.split.first
  end

  def who_is
    [name, location].reject(&:blank?).join(' - ')
  end
end
