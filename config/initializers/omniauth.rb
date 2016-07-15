Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '707071542775192', '4cc7a6798c4b7633fc88584d271d8a2c',
           scope: 'public_profile', info_fields: 'id,name,link'
  provider :google_oauth2, '749556761077-oeua6sec51lh31ee838lrs3omd27q7lh.apps.googleusercontent.com', 'yE_KlWtNNrNV9HKWnlOuTUAt',
           scope: 'profile', image_aspect_ratio: 'square', image_size: 48, access_type: 'online'
end