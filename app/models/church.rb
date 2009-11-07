class Church < ActiveRecord::Base
  belongs_to :minister
  attr_accessor :lat1, :lon1, :distance, :googlelink

	def selector_name
		"#{church_name} , #{physical_city} (#{pastor})"
	end

  def full_physical_address
    "#{physical_address}, #{physical_city}  #{physical_zip}"
  end

  def full_mailing_address
    "#{mailing_address}, #{mailing_city}  #{mailing_zip}"
  end

  def minister
    Minister.find(:first, :conditions => ['id = ?',minister_id])
  end


end
