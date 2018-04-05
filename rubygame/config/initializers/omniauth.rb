# Replace API_KEY and API_SECRET with the values you got from Google
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "747795763712-ai0g80onq9f8a3kin1nqp67fk1cbipp7.apps.googleusercontent.com", "3iLJlt7ZMqpZF7-BBb7745Ch"
end