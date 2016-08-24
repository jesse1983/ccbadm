class AddReferenceToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :title, :string
	Property.all.each do |p|
		sufix = p.code.split(".")
		if sufix.size > 1
			p.title = "22#{p.accountant_code}.#{sufix[1]}"
		else
			p.title = "22#{p.accountant_code}"
		end
		p.save
	end    
  end


end
