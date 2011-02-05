# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_project04_session',
  :secret      => '7ad0f7c8decd07a2b875666403483e995ef468bd8ed70113049446b56634bdeb148c56d0bc89e2d8a5f133ad98f4b30fcd9b5b26109ab9dd4b76f86d4ae3823d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
