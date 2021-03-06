require("spec_helper")

describe(List) do

  describe(".all") do
    it("starts off with no lists") do
      expect(List.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a list by its ID number") do
      test_list = List.new({:name => "Gam-Gam stuff", :id => nil})
      test_list.save()
      test_list2 = List.new({:name => "More Gam-Gam stuff", :id => nil})
      test_list2.save()
      expect(List.find(test_list2.id())).to(eq(test_list2))
    end
  end

  describe("#name") do
    it("tells you its name") do
      list = List.new({:name => "Gam-Gam", :id => nil})
      expect(list.name()).to(eq("Gam-Gam"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      list = List.new({:name => "Gam-Gam", :id => nil})
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save lists to the database") do
      list = List.new({:name => "Gam-Gam", :id => nil})
      list.save()
      expect(List.all()).to(eq([list]))
    end
  end

  describe("#tasks") do
    it("returns an array of tasks for that list") do
      test_list = List.new({:name => "Gam-Gam Jams", :id => nil})
      test_list.save()
      test_task = Task.new({:description => "Get roast beef sammies from the deli", :list_id => test_list.id()})
      test_task.save()
      test_task2 = Task.new({:description => "Pick up fancy yarn for epicly cozy narwhal sweater action", :list_id => test_list.id()})
      test_task2.save()
      expect(test_list.tasks()).to(eq([test_task, test_task2]))
    end
  end

  describe("#==") do
    it("is the same list if it has the same name") do
      list1 = List.new({:name => "Gam-Gam", :id => nil})
      list2 = List.new({:name => "Gam-Gam", :id => nil})
      expect(list1).to(eq(list2))
    end
  end

end
