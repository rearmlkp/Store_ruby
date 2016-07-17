class SearchsController < ApplicationController
  def index
  end

  def search
    p params['querystring']
    redirect_to searchs_index_path
  end
end
