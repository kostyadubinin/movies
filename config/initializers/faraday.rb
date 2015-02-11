$tmdb = Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
  faraday.params[:api_key] = ENV["TMDB_API_KEY"]
  faraday.request :url_encoded # form-encode POST params
  faraday.response :json, content_type: /\bjson$/
  faraday.response :logger # log requests to STDOUT
  faraday.adapter Faraday.default_adapter # make requests with Net::HTTP
end
