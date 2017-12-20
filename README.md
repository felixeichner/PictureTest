for deployment:
- for postgresql add host, username, password in config/locales/database.yml#production
- for devise to work add to config/environments/production.rb:
	config.action_mailer.default_url_options = { host: '???', port: ??? }
