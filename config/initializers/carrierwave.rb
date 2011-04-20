CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :s3
    config.s3_access_key_id = '05X6SXDVXV8EMGD8B8G2'
    config.s3_secret_access_key = 'caQD1f8OYQwCKWw+kxRyZv+iqNKIeiqn4GhUqmxp'
    config.s3_bucket = 'sprout-notes'
    # config.s3_access = :public_read
    config.s3_headers = {'Cache-Control' => 'max-age=315576000', 'Expires' => 99.years.from_now.httpdate}
  else
    config.storage = :file
  end
end