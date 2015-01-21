require("sinatra")
require("sinatra/reloader")
require("pg")
also_reload("lib/**/*.rb")
require("./lib/task")
require("./lib/list")

DB = PG.connect({:dbname => "to_do"})

get("/") do
  @lists = List.all()
  erb(:index)
end

post("/lists") do
  name = params.fetch("name")
  list = List.new({:name => name, :id => nil})
  list.save()
  @lists = List.all()
  erb(:index)
end

post("/tasks") do
  @description = params.fetch("description")
  task = Task.new({:description => @description})
  task.save()
  erb(:success)
end
