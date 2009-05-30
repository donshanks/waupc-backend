class Booking < ActiveRecord::Base
	belongs_to :deputation

	def church_name
		church = Church.find_by_id(church_id)	
		return (church != nil ) ? church.church_name : nil
	end

end
