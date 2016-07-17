require_relative 'user_search'

class CustomersController < ApplicationController
  def index
    if current_user.nil?
      redirect_to root_path
    end
    arr = %w(address province phone city email_account)
    arr.each { |item| current_user['_source']['info'][item] = '' unless current_user['_source']['info'].key? item }
  end

  def change_info
    arr = %w(address province phone city email_account)
    arr.each { |item| current_user['_source']['info'][item] = params[item] }
    current_user['_source']['info']['name'] = params['fullname']
    UserSearch.update current_user
    flash[:success] = 'Your account details has been changed!'
    redirect_to customers_index_path
  end
end
