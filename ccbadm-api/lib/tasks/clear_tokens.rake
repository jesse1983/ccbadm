desc "Clean up old tokens"
task :clean_tokens => :environment do
	Token.where("expire_at < ?",(Time.now() - 30.minutes)).delete_all
  	puts "Tokens clean!".green
end