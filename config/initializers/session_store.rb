# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Tutanak_session',
  :secret      => '601ddd54847c23e20853c9a39d51b29d9aa7446c4efaf53e56067be621ada113b34530eb219aa021538a4de226925452aeb9ec04e8b7eb975c236f2e54f96ef4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
