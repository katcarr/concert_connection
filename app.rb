require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file}


get("/") do
  @venues = Venue.all()
  erb(:index)
end

post("/add_venue") do
  name = params.fetch("name")
  @venue = Venue.new({:name => name})
  if @venue.save()
    redirect '/'
  else
    erb(:errors)
  end
end

get('/venue/:id') do
  @venue = Venue.find(params.fetch("id").to_i())
  erb(:venue)
end
