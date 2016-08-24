# -*- encoding : utf-8 -*-
# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Ccbonline::Application.initialize!

Time::DATE_FORMATS[:date] = "%d/%m/%Y"


