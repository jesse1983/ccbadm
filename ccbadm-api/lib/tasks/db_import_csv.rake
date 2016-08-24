# require "csv"
# require "i18n"

# desc "Import goods and invoices from CSV file"
# task "db:import:csv" => [:environment] do

#   rx_digits = /\d+/
#   rx_date = /^(\d{4})-(\d{2})-(\d{2})$/

#   # Buffers to be inserted into the database.
#   goods = []
#   invoices = []

#   # Cache all good entries.
#   line = 1
#   print "caching csv file..."
#   CSV.foreach("db/invoices.csv", :headers => true) do |row|
#     line += 1
#     goods.append({
#       line: line,
#       amount: row["QUANTIDADE"].to_i,
#       church: row["IGREJA"].strip,
#       place: row["LOCALIZ"].strip,
#       good_type: row["DESCRIÇÃO"].strip,
#       invoice: {
#         number: row["NR DOCTO"],
#         value: row["VALOR ORIG"],
#         date: row["DATA AQUIS"],
#         provider: row["FORNECEDOR"],
#       },
#     })
#   end
#   puts "#{line - 1}."

#   errors = []

#   db = {
#     churches: {},
#     places: {},
#     good_types: {},
#   }

#   print "fetching churches from db..."
#   goods.each do |g|
#     code = g[:church]
#     church = db[:churches][code]
#     if church == nil
#       code = code.scan(rx_digits).join
#       church = db[:churches][code]
#     end
#     if church == nil
#       print "."
#       church = Church.where(bras_code: "#{code[0..1]}-#{code[2..3]}-#{code[4..5]}").first
#       db[:churches][code] = church
#     end
#     if church == nil
#       errors.append("#{g[:line].to_s.rjust 5}: #{"Church.bras_code".rjust 16}: #{code}")
#     end
#     g[:church] = church
#   end
#   puts "#{db[:churches].count}."

#   print "fetching places from db..."
#   goods.each do |g|
#     name = g[:place]
#     place = db[:places][name]
#     if place == nil
#       print "."
#       place = Place.where(name: name).first
#       db[:places][name] = place
#     end
#     if place == nil
#       errors.append("#{g[:line].to_s.rjust 5}: #{"Place.name".rjust 16}: #{name}")
#     end
#     g[:place] = place
#   end
#   puts "#{db[:places].count}."

#   print "fetching good types from db..."
#   goods.each do |g|
#     name = g[:good_type]
#     good_type = db[:good_types][name]
#     if good_type == nil
#       print "."
#       good_type = GoodType.where(name: name).first
#       db[:good_types][name] = good_type
#     end
#     if good_type == nil
#       errors.append("#{g[:line].to_s.rjust 5}: #{"GoodType".rjust 16}: #{name}")
#     end
#     g[:good_type] = good_type
#   end
#   puts "#{db[:good_types].count}."

#   print "verifying invoice fields..."
#   n = 0
#   goods.each do |g|
#     i = g[:invoice]
#     nils = 0
#     if i[:number] == nil
#       nils += 1
#     end
#     if i[:value] == nil
#       nils += 1
#     end
#     if i[:date] == nil
#       nils += 1
#     end
#     if i[:provider] == nil
#       nils += 1
#     end
#     if nils != 0 and nils != 4
#       errors.append("#{g[:line].to_s.rjust 5}: #{"-".rjust 16}: #{nils} invoice fields are empty")
#     end
#     if nils != 0
#       g[:invoice] = nil
#       next
#     end
#     n += 1

#     begin
#       i[:date] = Date.parse(i[:date].scan(rx_date).join("-"))
#     rescue
#       errors.append("#{g[:line].to_s.rjust 5}: #{"Date".rjust 16}: #{i[:date]}")
#     end
#   end
#   puts "#{n}."

#   print "consolidating provider names..."
#   providers = []
#   goods.each do |g|
#     i = g[:invoice]
#     if i != nil
#       p = i[:provider]
#       if p != nil
#         providers.append(p)
#       end
#     end
#   end
#   providers.sort!.uniq!
#   puts "#{providers.count}."

#   print "fixing typos in provider names..."
#   providers.each do |p|
#     p.replace p.mb_chars.downcase.to_s

#     p.gsub!(/[\t\n ]+/, ' ')
#     p.gsub!(/ *-+ *$/, '')
#     p.gsub!(/-+/, ' - ')
#     p.gsub!(/([\.\/])+ */, '\1 ')

#     p.gsub!(/-* *\bm\.* *e\.* *$/, ' me')
#     p.gsub!(/-* *\bepp *$/, ' epp')
#     p.gsub!(/\bs\/* *a\b/, 's/a')
#     p.gsub!(/\bltda\b\.*/, 'ltda ')

#     p.gsub!(/\bacessorios\b/, 'acessórios')
#     p.gsub!(/\baco\b/, 'aço')
#     p.gsub!(/\bcomercio\b/, 'comércio')
#     p.gsub!(/\bcoml\./, 'comercial ')
#     p.gsub!(/\bcons?tru..o\b/, 'construção')
#     p.gsub!(/\bdistribui..o\b/, 'distribuição')
#     p.gsub!(/\bdeposito\b/, 'depósito')
#     p.gsub!(/\bdomesticas\b/, 'domésticas')
#     p.gsub!(/\beletric([ao]s?)\b/, 'elétric\1')
#     p.gsub!(/\beletronic([ao]s?)\b/, 'eletrônic\1')
#     p.gsub!(/\bescritorio(s?)\b/, 'escritório\1')
#     p.gsub!(/\bgrafica\b/, 'gráfica')
#     p.gsub!(/\bmaquina(s?)\b/, 'máquina\1')
#     p.gsub!(/\b(i?)moveis\b/, '\1móveis')
#     p.gsub!(/\bmúsica(l|is)\b/, 'musica\1')
#     p.gsub!(/\bpalacio\b/, 'palácio')
#     p.gsub!(/\bplasticos\b/, 'plásticos')
#     p.gsub!(/\brefrigera..o\b/, 'refrigeração')
#     p.gsub!(/\bseguranca\b/, 'segurança')

#     p.gsub!(/\b(materiais)(p\/)/, '\1 \2 ')
#     p.gsub!(/\bldta\b/, 'ltda')
#     p.gsub!(/\bletda\b/, 'ltda')
#     p.gsub!(/\bp1\b/, 'p/')
#     p.gsub!(/\bpontofrio\. *com\b/, 'pontofrio.com')
#     p.gsub!(/\bsta\. *isabel\b/, 'santa izabel')
#     p.gsub!(/\bultramaquinas\b/, 'ultra máquinas')
#     p.gsub!(/\bwsvaldo\b/, 'osvaldo')

#     p.gsub!(/ {2,}/, ' ')
#     p.strip!

#     p.replace p.mb_chars.upcase.to_s
#   end
#   providers.sort!.uniq!
#   puts "#{providers.count}."

#   providers.each do |p|
#     puts "  #{p}"
#   end

#   print "detecting similar provider names..."
#   providers_map = {}
#   providers.each do |p|
#     providers_map[I18n.transliterate(p).gsub(/[ \/.-]+/, " ").strip.downcase] = p
#   end
#   puts "#{providers_map.count}."

#   if errors.count > 0
#     errors.each do |e|
#       puts " > #{e}"
#     end
#     puts "#{errors.count} errors found -- import task aborted (nothing done)"
#     next
#   end

#   # CSV file processed -- write the buffer to the database.
#   # TODO

# end
