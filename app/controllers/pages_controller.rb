class PagesController < ApplicationController
  def index
    @brazilians = Brazilian.order('created_at DESC').limit(30)
  end
end
