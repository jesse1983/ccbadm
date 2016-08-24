# # -*- encoding : utf-8 -*-
# #encoding: UTF-8
# class Importer
# 	attr_accessor :import, :errors, :good

# 	def initialize id
# 		self.errors = []
# 		self.import = Import.find id
# 		if self.import.good_id == nil
# 			create_good()
# 		end
# 	end

# 	def create_good
# 		self.good = Good.new
# 		import = self.import


# 		import.potencia = format(import.potencia)
# 		import.marca = format(import.marca)
# 		import.num_serie = format(import.num_serie)
# 		import.altura = format(import.altura)
# 		import.largura = format(import.largura)
# 		import.comprimento = format(import.comprimento)
# 		import.observacao = format(import.observacao)


# 		import.localizacao = from_to(import.localizacao, "place_id")
# 		import.tensao = from_to(import.tensao, "voltage_id")
# 		import.material = from_to(import.material, "material_id")
# 		import.objeto = from_to(import.objeto, "good_type_id")

# 		self.good.church_id = import.church_id
# 		good_type = GoodType.where name: import.objeto
# 		if good_type.size > 0
# 			self.good.good_type_id = good_type.first.id
# 		end


# 		self.good.amount = 1
# 		self.good.brand = import.marca if import.marca != nil
# 		self.good.model = import.modelo if import.modelo != nil
# 		self.good.serial_number = import.num_serie if import.num_serie != nil
# 		self.good.height_meters = import.altura if import.altura != nil
# 		self.good.width_meters = import.largura if import.largura != nil
# 		self.good.length_meters = import.comprimento if import.comprimento != nil
# 		self.good.power_watts = import.potencia if import.potencia != nil
# 		self.good.description = import.observacao if import.observacao != nil

# 		material = Material.where name: import.material
# 		if material.size > 0
# 			self.good.material_id = material.first.id
# 		end

# 		voltage = Voltage.where name: import.tensao
# 		if voltage.size > 0
# 			self.good.voltage_id = voltage.first.id
# 		end

# 		place = Place.where name: import.localizacao
# 		if place.size > 0
# 			self.good.place_id = place.first.id
# 		end

# 		if self.good.save
# 			self.import.update_attributes good_id: self.good.id
# 			self.import.import_errors.delete_all
# 			true
# 		else
# 			self.errors = self.good.errors
# 			ImportError.where(import_id: self.import.id).delete_all
# 			ImportError.create(import_id: self.import.id, name: self.errors.messages.keys.join(", "))
# 			false
# 		end
# 	end

# 	protected

# 	def format value

# 		case value
# 		when nil
# 		  nil
# 		when 0
# 		  nil
# 		when '0'
# 		  nil
# 		else
# 			value = value.gsub(",",".")
# 			value
# 		end
# 	end

# 	def from_to value, field
# 		case value
# 		when 0
# 			nil
# 		when 'X'
# 			nil
# 		when '0'
# 			nil
# 		else
# 			c = Correction.where from: value, att: field
# 			if c.size > 0
# 				c.first.to
# 			else
# 				value
# 			end
# 		end
# 	end
# end
