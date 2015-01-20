require('rspec')
require('task')

describe(Task) do
  describe("#description") do
    it("lets you give it a description") do
      test_task = Task.new("go get coffee")
      expect(test_task.description()).to(eq("go get coffee"))
    end
  end

end
