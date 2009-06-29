# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_wants_session',
  :secret      => '07e99f134a8ad4319d9a828dcff252a6bff7ba1ca0009fca4ed84d165d60e69b2aa469c1e7d6a543765b989aea7f856d364f2432f8bb903de557e4e58fa8abf5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
