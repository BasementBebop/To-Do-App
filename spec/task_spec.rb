require('rspec')
require('pg')
require('task')

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end

describe(Task) do

  describe("#description") do
    it("lets you give it a description") do
      test_task = Task.new({:description => "meet gam-gam at the deli for roast beef sammies"})
      expect(test_task.description()).to(eq("meet gam-gam at the deli for roast beef sammies"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new({:description => "meet gam-gam at the deli for roast beef sammies"})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe("#==") do
    it("is the same task if it has the same description") do
      task1 = Task.new({:description => "learn SQL"})
      task2 = Task.new({:description => "learn SQL"})
      expect(task1).to(eq(task2))
    end
  end

end
