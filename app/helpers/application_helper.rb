module ApplicationHelper

	def flash_class(level)
    	case level.to_sym
     	 when :success then "alert alert-success"
     	 when :info then "alert alert-info"
     	 when :danger then "alert alert-danger"
     	 when :warning then "alert alert-warning"
   		end
 	 end
end
