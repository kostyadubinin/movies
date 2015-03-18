VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.ignore_hosts 'codeclimate.com'

  config.filter_sensitive_data("TMDB_API_KEY") { ENV["TMDB_API_KEY"] }
  config.default_cassette_options = {
    match_requests_on: [VCR.request_matchers.uri_without_param(:api_key)]
  }
end
