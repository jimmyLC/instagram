Rails.application.config.middleware.use OmniAuth::Builder do
  config = YAML.load( File.read("#{Rails.root}/config/facebook.yml"))[Rails.env]

  provider :facebook, config["app_id"], config["secret"],
           :scope => 'email, user_photos, read_friendlists, read_stream'

end