# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_BackChannel_Application_V2_session',
  :secret      => '82de241085cbe0666f48b9b7bac8906eec699bc48e02a44d308cd2665c064bc192bafd0bae21a608671a2d1d71d5aed00a908ac5d453f162d6f8930b817c4080'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
