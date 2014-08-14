class PagesController < ApplicationController
  
  def home
  	if current_user
	  	@alerts = current_user.alerts
  	else
  		@alerts = []
  	end
  end

  def about
  end

end
