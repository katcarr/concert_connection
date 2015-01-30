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

get("/band_edit/:id") do
  @band = Band.find(params.fetch("id").to_i())
  @venues = Venue.all()
  erb(:band_edit)
end

patch("/update_band_name") do
  @band = Band.find(params.fetch("id").to_i())
  new_name = params.fetch("new_name")
  @band.update({:name => new_name})
  redirect("/band/#{@band.id()}")
end

delete("/delete_band") do
  @band = Band.find(params.fetch("id").to_i())
  @band.destroy()
  redirect('/')
end

post("/band_concerts") do
  @band = Band.find(params.fetch("id").to_i())
  venue_ids = params.fetch("venue_ids")
  venue_ids.each() do |id|
    @band.venues() << Venue.find(id.to_i())
  end
  redirect("/band/#{@band.id()}")
end
