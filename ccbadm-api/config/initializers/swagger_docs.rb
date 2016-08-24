# encoding : utf-8
class Swagger::Docs::Config
  def self.base_api_controller; Api::ApiController end
end


Swagger::Docs::Config.register_apis({
  "1.0" => {
    # the extension used for the API
    :api_extension_type => :json,
    # the output location where your .json files are written to
    :api_file_path => "public/api-docs",
    # the URL base path to your API
    :base_path => "http://ccbadm.com.br/api",
    # if you want to delete all .json files at each generation
    :clean_directory => true,
    # add custom attributes to api-docs
    :attributes => {
      :info => {
        "title" => "CCB ADM",
        "description" => "API Doc",
        # "termsOfServiceUrl" => "http://helloreverb.com/terms/",
        "contact" => "jesse.pinheiro@congregacao.org.br",
        "license" => "Apache 2.0",
        "licenseUrl" => "http://www.apache.org/licenses/LICENSE-2.0.html"
      }
    }
  }
})
