# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_carrito_session',
  :secret      => 'aad9917a58d90d6c6a154f19e1cdd20d38a06e5102c1d513e65aaa329d886341ba2810f14800574d98f265b6c696991643895b23c9a25d1a1f87f39acdb83dec'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
