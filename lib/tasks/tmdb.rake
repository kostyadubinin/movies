namespace :tmdb do
  desc "Fetches some movies and store them to a file"
  task test: :environment do
    movies = []

    latest_id = $tmdb.get("movie/latest").body["id"]

    (latest_id-100..latest_id).each do |e|
      movies << $tmdb.get("movie/#{e}").body
    end

    movies.reject! { |m| m["status_code"] == 6 }

    File.open("movies.json","w") do |f|
      f.write(movies.to_json)
    end
  end
end
