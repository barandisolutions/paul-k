# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_admin_nested_session',
  :secret      => '2b5e5f198022524e51ebcf819328056bcc8eae15619bb2d6680165ebcb0d3dabafa2a7571a3b94f42e9b2f619d1beb1e19b9a33a31c0322e09f0fa1e539b2112'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
