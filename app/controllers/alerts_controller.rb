class AlertsController < ApplicationController
  
  def index
  	
  end

  def create
  	@alert = Alert.create(safe_alert)

  	if @alert.save

  	end
  end


  def manage_alerts
  	@alerts = Alert.all
  	@alerts = current_user.alerts
  end

  def new
  	@alert = Alert.new
  end

  def show
  	@alert = current_user.alert
		if !@alert 
			redirect_to new_user_alert_path(current_user)
		end
  end

  private

  def safe_alert
  	params.require(:alert).permit(:train_line, :start_time, :end_time, :sms, :email)	
  									#^table name!
  end

end


  