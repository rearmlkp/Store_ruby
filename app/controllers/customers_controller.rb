require_relative 'user_search'

class CustomersController < ApplicationController
  def index
    if current_user.nil?
      redirect_to root_path
    end
    unless current_user['_source']['info'].key? 'address'
      current_user['_source']['info']['address'] = '';
    end
    unless current_user['_source']['info'].key? 'address'
      current_user['_source']['info']['city'] = '';
    end
    unless current_user['_source']['info'].key? 'address'
      current_user['_source']['info']['province'] = '';
    end
    unless current_user['_source']['info'].key? 'address'
      current_user['_source']['info']['phone'] = '';
    end
    unless current_user['_source']['info'].key? 'address'
      current_user['_source']['info']['email_account'] = '';
    end
  end

  def change_info
    current_user['_source']['info'] =
        {
            'name': params['fullname'],
            'address': params['address'],
            'city': params['city'],
            'province': params['province'],
            'phone': params['phone'],
            'email_account': params['email_account']
        }
    # p current_user
    UserSearch.update current_user
    flash[:success] = 'Your account details has been changed!'
    redirect_to customers_index_path
  end
end
