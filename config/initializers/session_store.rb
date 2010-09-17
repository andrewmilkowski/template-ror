# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_template-ror_session',
  :secret      => 'bb9ed6aae81d02af6603906abf2dbbeb57e20e255f88bf7d6bf00fda670a98b6af5581a8b2cee344bab4103058183ef8545e71823d549950dab652a953c60ef2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
