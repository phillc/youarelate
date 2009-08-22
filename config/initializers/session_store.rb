# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_youarelate_session',
  :secret      => 'ad200b44f7c88a0deb9a2bb1b5f61ef1a22a28194043c8d673ad2fa02bfbdef30b7d44676bc00b996be4414f3b834637d41f6a8ef6a3b126d483e40f911a1e8c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
