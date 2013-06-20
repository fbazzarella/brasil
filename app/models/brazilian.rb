class Brazilian < User
  TOTAL_PEOPLE_TO_SHOW = 30

  scope :recent, -> { order('created_at DESC').limit(TOTAL_PEOPLE_TO_SHOW) }

  def self.total_other_people
    self.count - TOTAL_PEOPLE_TO_SHOW
  end

  def first_name
    name.split.first
  end
end
