# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cannibook_session',
  :secret      => '3291ad4eb6848cb4a4cf3e6ecf53dc2802b2bacf760903be3568582caa4e5225175ba637375393f86aa1b00836b6f9b11825f327e9e2926585ddefc15632da5e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
