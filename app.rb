require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file}


get("/") do
  @venues = Venue.all()
  @bands = Band.all()
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

post("/add_band") do
  name = params.fetch("name")
  @band = Band.new({:name => name})
  if @band.save()
    redirect '/'
  else
    erb(:errors)
  end
end


get('/venue/:id') do
  @venue = Venue.find(params.fetch("id").to_i())
  erb(:venue)
end

get('/band/:id') do
  @band = Band.find(params.fetch("id").to_i())
  erb(:band)
end

get("/band_form") do

  erb(:band_form)
end

post("/add_band") do

  erb(:band)
end
