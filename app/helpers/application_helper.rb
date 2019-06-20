module ApplicationHelper
	def is_show_navbar?
		(controller_name == "leads" && action_name != "index")
	end
end
