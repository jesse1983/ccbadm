# # encoding : utf-8
# require 'colorize'
# # require 'Mdb'

# desc "Importing pbd.mdb"
# task :pbd, [:skip] => :environment do |t, args|
# 	# run as rake pbd['properties;taxes;collections']
# 	puts "
# +-----------------------+
# |Welcome do PDB Importer|
# +-----------------------+
# 	"
# 	puts args[:skip]
# 	puts "Estabilishing database connections... "
# 	# Estabilish database connection
# 	conn = ActiveRecord::Base.connection

# 	# Estabilish mdb connection
# 	pbd = Mdb.open "db/PBD_BE.MDB"

# 	puts "Done\n".green

# 	# Import properties
# 	if must_import? "properties", args
# 		start_time = DateTime.now
# 		puts "Importing properties...".yellow
# 		conn.execute "TRUNCATE properties RESTART IDENTITY"
# 		total = pbd[:Cabeçalho].size
# 		churches = Hash.new
# 		Church.all.map{|c| churches[c.bras_code] = c.id}
# 		records = Array.new
# 		pbd[:Cabeçalho].each do |p|
# 			att = Hash.new
# 			church = Church.where(bras_code: getBrasCode(p[:CódBrás])).first
# 			att[:church_id] = churches[getBrasCode(p[:CódBrás])]
# 			att[:code] = p[:CódContábil]
# 			att[:group_code] = p[:CódGrupo]
# 			att[:accountant_code] = p[:CódContador]
# 			att[:cartographic_code] = p[:CódCartograf]
# 			att[:has_church] = p[:CasaOração]
# 			att[:is_active] = p[:Ativo]
# 			att[:object] = p.to_json
# 			records.push Property.new att
# 			print "Importing #{records.size} of #{total}\r".yellow
# 			$stdout.flush
# 		end
# 		puts "Importing #{records.size} of #{total}\r"

# 		# records.each {|r| puts r}
# 		ActiveRecord::Base.transaction do
# 			records.each {|r| r.save!}
# 		end
# 		puts "Done: #{records.size} imported properties".green
# 		puts "Time: #{((DateTime.now - start_time)* 1.days).to_i} seconds\n".green
# 	end

# 	if must_import? "taxes", args

# 		# Import taxes
# 		puts "Importing taxes...".yellow
# 		conn.execute "TRUNCATE taxes RESTART IDENTITY"
# 		count = 0
# 		total = pbd[:IPTU].size
# 		pbd[:IPTU].each do |p|
# 			att = Hash.new
# 			att[:property_id] = Property.find_by(code: p[:CódContábil]).id if Property.find_by(code: p[:CódContábil])
# 			att[:category] = 1
# 			att[:owner_name] = if p[:NomeProprietário] == 'Outro' then p[:OutroProprietário] else p[:NomeProprietário] end
# 			att[:buyer_name] =  if p[:NomeComprador] == 'Outro' then p[:OutroComprador] else   p[:NomeComprador] end
# 			att[:shipping_address] = if p[:EndereçoEntrega] == 'Outro' then p[:OutroEndEntrega]  else p[:EndereçoEntrega] end
# 			att[:comments] = p[:Observações]
# 			att[:immunity_number] = p[:NunProtImunidade]
# 			att[:immunity_file] = p[:LinkImunidade]
# 			att[:unified] = p[:UnificaçãoCarnê] != nil
# 			att[:unified_number] = p[:NumProtUnificCarnê]
# 			att[:unified_file] = p[:LinkUnifCarnê]
# 			att[:object] = p.to_json
# 			count = count + 1 if Tax.create att
# 			print "Importing #{count} of #{total}\r".yellow
# 			$stdout.flush
# 		end

# 		puts "Done: #{count} imported taxes\n".green
# 	end



# 	if must_import? "collections", args
# 		# Import collections
# 		start_time = DateTime.now
# 		puts "Importing collections...".yellow
# 		taxes = Hash.new
# 		Tax.all.map{|t| taxes[t.object['CódIPTU']] = t.id}
# 		records = Array.new
# 		total = pbd['ValoresIPTU'].size
# 		pbd['ValoresIPTU'].each do |p|
# 			att = Hash.new
# 			# puts Tax.where("OBJECT->>'CódIPTU'='#{p[:CódIPTU]}'").to_sql
# 			att[:tax_id] = taxes[p[:CódIPTU]]
# 			att[:property_price] = p[:"ValorImpostoR$"] if p[:"ValorImpostoR$"].to_i > 0
# 			att[:trash_price] = p[:"TaxaLixoR$"] if p[:"TaxaLixoR$"].to_i > 0
# 			att[:casualty_price] = p[:"TaxaSinistroR$"] if p[:"TaxaSinistroR$"].to_i > 0
# 			att[:period] = p[:Exercício].to_i
# 			att[:expire_date] = p[:DataVencimento]
# 			att[:payment_price] = p[:ValorDevido] if p[:"ValorDevido"].to_i > 0
# 			att[:payment_date] = p[:DataPag]
# 			att[:paid] = (p[:Quitado] == 'Sim')
# 			att[:paid_price] = p[:ValorPago] if p[:"ValorDevido"].to_i > 0
# 			att[:reason_non_payment] = p[:MotivoInadimplencia]
# 			att[:credit_price] = p[:CréditoIPTU] if p[:CréditoIPTU].to_i > 0
# 			att[:credit_date] = p[:DataDOMcrédito] if p[:DataDOMcrédito].to_i > 0
# 			att[:actual_debt] = p[:DívidaCorrente] if p[:DívidaCorrente].to_i > 0
# 			att[:active_debt] = p[:DívidaAtiva] if p[:DívidaAtiva].to_i > 0
# 			att[:legal_debt] = p[:DívidaJudicial] if p[:DívidaJudicial].to_i > 0
# 			att[:suspended_debt] = p[:DívidaSuspensa] if p[:DívidaSuspensa].to_i > 0
# 			att[:divided_debt] = p[:DívidaParcelada] if p[:DívidaParcelada].to_i > 0
# 			# count = count + 1 if print att
# 			att[:object] = p.to_json
# 			records.push Collection.new att
# 			print "Importing #{records.size} of #{total}\r".yellow
# 			$stdout.flush
# 		end

# 		puts "Importing #{records.size} of #{total}\r"

# 		# records.each {|r| puts r}
# 		ActiveRecord::Base.transaction do
# 			conn.execute "TRUNCATE collections RESTART IDENTITY"
# 			records.each {|r| r.save!}
# 		end
# 		puts "Done: #{records.size} imported collections".green
# 		puts "Time: #{((DateTime.now - start_time)* 1.days).to_i} seconds\n".green
# 	end


# 	if must_import? "terrains", args
# 		# Import terrains
# 		conn.execute "UPDATE properties SET category = NULL, status = NULL, situation = NULL, address = NULL, zipcode = NULL, zone = NULL, income = NULL, quarter = NULL, court = NULL, lot = NULL, terrain_area = NULL, width_area = NULL, main_area = NULL, trash_area = NULL, secondary_area = NULL, excess_area = NULL, default_type = NULL, default_category = NULL, rate = NULL, comment = NULL, object_terrain = NULL"
# 		start_time = DateTime.now
# 		puts "Importing terrains...".yellow
# 		total = pbd['BaseImóvel'].size
# 		records = Array.new
# 		pbd['BaseImóvel'].each do |p|
# 			att = Hash.new
# 			att[:category] = p[:Tipo]
# 			att[:status] = p[:Andamento]
# 			att[:situation] = p[:Situação]
# 			att[:address] = p[:EndereçoImóvel]
# 			att[:zipcode] = p[:CepImóvel]
# 			att[:zone] = p[:Zoneamento]
# 			att[:income] = p[:Receita].to_i if p[:Receita] != nil
# 			att[:quarter] = p[:Quarteirão]
# 			att[:court] = p[:Quadra]
# 			att[:lot] = p[:Lote]
# 			att[:terrain_area] = toNumber p[:ÁreaTerreno]
# 			att[:width_area] = toNumber p[:TestadaTerreno]
# 			att[:main_area] = toNumber p[:ÁreaPrincipal]
# 			att[:trash_area] = toNumber p[:ÁreaGeoFreqLixo]
# 			att[:secondary_area] = toNumber p[:ÁreaDependência]
# 			att[:excess_area] = toNumber p[:ÁreaExcedente]
# 			att[:default_type] = p[:TipoPadrão]
# 			att[:default_category] = p[:CategoriaImóvel]
# 			att[:rate] = p[:Alícota].gsub("%","").gsub(".","").gsub(",",".").to_i.to_f.round(2) / 100  if p[:Alícota] != nil
# 			att[:comment] = p[:Observações]
# 			att[:full_address] = "#{att[:address]}, Campinas, SP - #{att[:zipcode]}" if att[:address] != nil && att[:zipcode] != nil

# 			att[:object_terrain] = p.to_json
# 			prop = Property.where("object->>'CódContábil' = '#{p[:CódContábil]}'")
# 			if prop.size > 0
# 				att.each do |key, value|
# 					prop.first[key] = value
# 				end
# 				records.push prop.first
# 				print "Importing #{records.size} of #{total}\r".yellow
# 				$stdout.flush
# 			end
# 		end

# 		puts "Importing #{records.size} of #{total}\r"

# 		ActiveRecord::Base.transaction do
# 			records.each do |r|
# 				begin
# 					r.save
# 				rescue
# 					puts "Error ##{r.id}, #{r.main_area}".red
# 				end
# 			end
# 		end


# 		puts "Done: #{records.size} imported collections".green
# 		puts "Time: #{((DateTime.now - start_time)* 1.days).to_i} seconds\n".green
# 	end


# end


# def must_import? resource, args
# 	if args[:skip] != nil
# 		!args[:skip].include?(resource)
# 	else
# 		true
# 	end
# end

# def getBrasCode string

# 	if string.class == String
# 		if string.index("-") == nil
# 			if string.size >= 4
# 				string = string[0..1] + "-" + string[2..3] + "-" + string[4..5]
# 			end
# 		end
# 	end
# 	return string
# end

# def toNumber field
# 	result = nil
# 	result = field.gsub(".","").gsub(",",".").to_f.round(2) unless field == nil
# 	result = nil if result == 0.00
# 	result
# end
