class Task

  @@all_tasks = []

  attr_reader(:description)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
  end

  define_method(:==) do |other|
    same_class = self.class().eql?(other.class())
    same_description = self.description().eql?(other.description())
    same_class.&(same_description)
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
