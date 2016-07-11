Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '707071542775192', '4cc7a6798c4b7633fc88584d271d8a2c',
           scope: 'public_profile', info_fields: 'id,name,link'
end