class PagesController < ApplicationController
  
  def home
  	@alerts = current_user.alerts
  end

  def about
  end

end
