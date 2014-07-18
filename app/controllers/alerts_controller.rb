class AlertsController < ApplicationController
   def index
    @alerts = Alert.all
   end
   
   def new
    @alert = Alert.new
   end

   def show
    @alert = Alert.find(params[:id])
   end
  
  def create
    
    @alert = Alert.new(alert_params)
    @alert.user = current_user
    respond_to do |format|
      if @alert.save
        format.html { redirect_to @alert, notice: 'alert was successfully created.' }
      # else
      #   format.html { render :new }
      end
    end
  end

  # def update
  #   respond_to do |format|
  #     if @alert.update(alert_params)
  #       format.html { redirect_to @alert, notice: 'alert was successfully updated.' }
  #     else
  #       format.html { render :edit }
  #     end
  #   end
  # end
private
    # Use callbacks to share common setup or constraints between actions.
    # def set_alert
    #   @alert = alert.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alert_params
      params.require(:alert).permit(:start, :end, :last_sent, :sms, :email, :user_id, :line_id, :recipient_id)
    end
end
