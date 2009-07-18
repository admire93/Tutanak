# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Tutanak_session',
  :secret      => 'e87cf35381d889ba9458c9f9c6594435060a273ff72d3c3192c295fad41c420cce5fa53c79787077653dab188e9084b1ad5df1f2be9bf8a1bdfd2df7925c841d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
