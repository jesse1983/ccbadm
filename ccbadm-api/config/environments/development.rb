# -*- encoding : utf-8 -*-
Ccbonline::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = true
  # config.cache_store = :memory_store, { size: 64.megabytes }
  config.cache_store = :dalli_store, ENV['MEMCACHED_URL']

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # config.after_initialize do
  #   Bullet.enable = true
  #   Bullet.alert = true
  #   Bullet.bullet_logger = false
  #   Bullet.console = true
  #   Bullet.growl = false
  #   # Bullet.xmpp = { :account  => 'bullets_account@jabber.org',
  #   #                 :password => 'bullets_password_for_jabber',
  #   #                 :receiver => 'your_account@jabber.org',
  #   #                 :show_online_status => true }
  #   Bullet.rails_logger = false
  #   Bullet.bugsnag = false
  #   Bullet.airbrake = false
  #   Bullet.add_footer = false
  #   # Bullet.stacktrace_includes = [ 'your_gem', 'your_middleware' ]
  # end


  config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')
  config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
  config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/

  config.serve_static_files = false

end
