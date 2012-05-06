Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env == "production"
  	key = '378397755546311'
  	secret = '1a1691d37239100a585d5401e7a52de3'
  else
  	key = '195519233854114'
  	secret = 'dbe88f55b3ea0616733205d457f1e723'
  end

  provider :facebook, 	key, secret, display: 'popup'
end