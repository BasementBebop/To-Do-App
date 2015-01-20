class Task

  @@all_tasks = []

  attr_reader(:name, :description)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @description = attributes.fetch(:description)
  end

  define_singleton_method(:all) do
    @@all_tasks
  end

  define_method(:save) do
    @@all_tasks.push(self)
  end

  define_singleton_method(:clear) do
    @@all_tasks = []
  end

end
