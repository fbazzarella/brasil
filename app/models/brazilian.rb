class Brazilian < User
  def first_name
    name.split.first
  end
end
