class PagesController < ApplicationController
  def index
    @brazilians         = Brazilian.recent.with_photo
    @total_other_people = Brazilian.total_other_people
  end
end
