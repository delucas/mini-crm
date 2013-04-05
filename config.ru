Dir.glob("./controllers/*.rb") do |controller|
  require controller
end

Dir.glob("./model/*.rb") do |model|
  require model
end

map("/") do
  run WelcomeController
end

map("/contact") do
  run ContactController
end