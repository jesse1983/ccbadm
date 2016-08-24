# -*- encoding : utf-8 -*-
module Api
	class LoginController < Api::ApiController
		skip_before_filter :authenticate, only: :create


		# swagger_controller :login, 'Login'
		# swagger_api :create do
		# 	summary 'Login to get a token'
		# 	notes 'This endpoint is for get a token to access all system'
		# 	param :query, :email, :string, :required, "E-mail"
		# 	param :query, :password, :string, :required, "Password"
		# end
		# swagger_api :show do
		# 	summary 'Show current user details'
		# 	notes 'This endpoint is for get a token to access all system'
		# 	response :unauthorized
		# end
		# swagger_model :Token do
		# 	description "A token to get a access"
		# 	property :token, :string, :required, "Token"
		# 	property :expire_at, :datetime, :required, "Expire at"
		# end
		def create
			if get_params().has_key?("email") 
				user = User.where email: get_params()[:email]
				if user.size > 0
					user = user.first
					user.password = get_params()[:password]
					if user.encrypt == user.encrypted_password
						Ability.new user
						@token = user.tokens.last
						@token = user.create_token unless @token
						@user = user
						@current_user = user
						Rails.cache.write "token:#{@token.token}", @token, expires_in: 30.minutes
						render :template => "api/#{controller_name}/show"
					else
						render(:json => {error: "Senha incorreta"}, :status => 403)
					end
				else
					render(:json => {error: "E-mail inválido"}, :status => 403)

				end

			else
				render(:json => {error: "E-mail não foi preenchido"}, :status => 400)
			end
		end
		def show
			@user = @current_user
		end
		def destroy
			@token.delete
			Rails.cache.delete "token:#{@token.token}"
			render :json => {ok: "Logout"}
		end
		protected
		def get_params
			params.permit(:email,:password)
		end

	end
end
