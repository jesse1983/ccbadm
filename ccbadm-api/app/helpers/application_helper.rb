# -*- encoding : utf-8 -*-
module ApplicationHelper

	def boolean_print value
		if value == true || value == 1 || value == "1"
			"Sim"
		else
			"Não"
		end
	end

	def expand_children object, children
		false
	end

	def expand? object, to_expand
		if params[:expand] && controller_name == object.class.name.pluralize.downcase
			if params[:expand].include?(to_expand)
				return true
			end
		end
		return false
	end

end
