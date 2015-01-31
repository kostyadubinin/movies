tmdb_api_url = 'https://api.themoviedb.org/3/'
params = { api_key: ENV["TMDB_API_KEY"] }

$tmdb = Faraday.new(url: tmdb_api_url, params: params) do |faraday|
  faraday.request  :url_encoded             # form-encode POST params
  faraday.response :json, :content_type => /\bjson$/
  faraday.response :logger                  # log requests to STDOUT
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end
