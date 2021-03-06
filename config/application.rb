require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)



module TestGuru
  class Application < Rails::Application
    config.before_configuration do 
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      if File.exists?(env_file)
        YAML.load(File.open(env_file)).each do |key, value| 
          ENV[key.to_s] = value
        end
      end 
      ENV['IMG_BADGES_PATH'] = "#{Rails.root}/app/assets/images/badges"
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.i18n.default_locale = :ru

    config.autoload_paths << "#{Rails.root}/lib/clients"
    # add local variables to ENV

  end
end
