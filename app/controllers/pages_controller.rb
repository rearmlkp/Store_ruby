class PagesController < ApplicationController
  def index
    flash.delete(:success)
  end
end
