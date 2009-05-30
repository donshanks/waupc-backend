class PostOffice < ActionMailer::Base

	def confirmation_notice(missionary,pastor,church,date_time)

		@recipients   = "donshanks@gmail.com"
		@from         = "webdev@waupc.net"
#		@cc           = "foreignmissions@waupc.org"
#		@bcc          = "webdev@waupc.net"
		@subject      = "Missionary Booking Confirmation"
		@sent_on      = Time.now
		@content_type = "text/html"

		body[:missionary] = missionary
		body[:pastor]     = pastor
		body[:church]     = church
		body[:date_time]  = date_time

	end

end
