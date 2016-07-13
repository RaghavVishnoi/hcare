OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '622927601013-19t1tq2gb2bih11m4gd6dnslqt5asg4d.apps.googleusercontent.com', 'ezrfCQG2CTG7lFxihNZw_wDw', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end