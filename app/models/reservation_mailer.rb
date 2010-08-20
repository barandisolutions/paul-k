class ReservationMailer < ActionMailer::Base
  def reservation_email(reservation)
    recipients "senthil196@gmail.com"
    from "Commencement Connections <manager@commencementconnections.com>"
    subject "New Reservation"
    sent_on Time.now
    body :reservation => reservation
  end
end

