namespace :tmdb do
  desc "Fetches some movies and store them to a file"
  task :test, [:count] => :environment do |t, args|
    ending_id = $tmdb.get("movie/latest").body["id"]
    starting_id = ending_id - args[:count].to_i

    movies = (starting_id...ending_id).map do |i|
      body = $tmdb.get("movie/#{i}").body
      puts "%7d\t%s" % [ending_id - i, body["title"]]
      body
    end

    movies.reject! { |m| m["status_code"] == 6 }

    File.open("movies.json","w") do |f|
      f.write(movies.to_json)
    end
  end
end
