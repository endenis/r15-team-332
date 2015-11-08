# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.

# assets for audio recording
Rails.application.config.assets.precompile += %w( libmp3lame.min.js mp3Worker.js recorderWorker.js recordmp3.js lib/recording.js lib/recording_form.js )

Rails.application.config.assets.precompile += %w( question.js )

Rails.application.config.assets.precompile += %w( lol/new.css )
Rails.application.config.assets.precompile += %w( views/index.css )
Rails.application.config.assets.precompile += %w( views/new.css )
