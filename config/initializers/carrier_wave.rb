if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['S3_SECRECT_ACCESS_KEY'],
      region:                'eu-central-1',
    }
    config.fog_directory  = ENV['S3_BUCKET']
  end
end