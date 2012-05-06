Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 	'378397755546311', '1a1691d37239100a585d5401e7a52de3', display: 'popup'
end