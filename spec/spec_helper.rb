require("bundler/setup")
Bundler.require(:dafult, :test)
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file}

RSpec.configure do |config|
  config.after(:each) do
    Band.all.each() do |band|
      band.destroy()
    end

    Venue.all().each() do |venue|
      venue.destroy()
    end
  end
end
