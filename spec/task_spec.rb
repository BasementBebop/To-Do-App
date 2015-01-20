require('rspec')
require('task')

describe(Task) do
  before() do
    Task.clear()
  end

  describe("#description") do
    it("lets you give it a description") do
      test_task = Task.new({:name => "lunch", :description => "meet gam-gam at the deli for roast beef sammies"})
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
      test_task = Task.new({:name => "lunch", :description => "meet gam-gam at the deli for roast beef sammies"})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved tasks") do
      test_task = Task.new({:name => "lunch", :description => "meet gam-gam at the deli for roast beef sammies"})
      test_task.save()
      Task.clear()
      expect(Task.all()).to(eq([]))
    end
  end

end
