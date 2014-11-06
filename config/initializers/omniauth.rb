Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '295391154000207', '517163ddb151fb5bf9477ed2a3ca6338',
  :scope => 'email, user_photos, read_friendlists, read_stream'
end