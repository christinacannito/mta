class ConfirmationMailer < ActionMailer::Base
  default from: "nyc.subwayalerts@gmail.com"

  def confirmation_email(alert, email)
    @alert = alert
    mail(to: email ,subject: "Sent from Subway smart alarm app!")
  end

end