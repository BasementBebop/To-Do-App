require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/task")

get("/") do
  @tasks = Task.all()
  erb(:index)
end

post("/tasks") do
  @name = params.fetch("name")
  @description = params.fetch("description")
  task = Task.new({:name => @name, :description => @description})
  task.save()
  erb(:success)
end
