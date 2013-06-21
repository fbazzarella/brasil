class PagesController < ApplicationController
  def index
    respond_to do |f|
      f.html do
        @brazilians         = Brazilian.recent.with_photo
        @total_other_people = Brazilian.total_other_people
      end

      f.json do
        render json: Brazilian.entire_list_in_json
      end
    end
  end
end
