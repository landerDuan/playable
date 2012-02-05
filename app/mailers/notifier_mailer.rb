class NotifierMailer < ActionMailer::Base
  default :date => Time.zone.now,
          from: "Notifier <red@playab.net>"
          
  def test(message)
    mail(
      :subject => message,
      :to => 'dev@playab.net'
    )
  end
end
