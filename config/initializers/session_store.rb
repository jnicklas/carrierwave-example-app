# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_carrierwave-example-app_session',
  :secret      => 'dfd13fd13e68dc496527584d01be5d8f1da88b2905ea4da5eec16241dd21d67dbbe6c9d311bb0e3ed99c82c40c232f5a2bd8e7a63a841bce083ce4553cefcc71'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
