re 'rspec'
require_relative 'task'

describe Task do
    let(:task) { Task.new(title: "Dog", description: "Walk the dog") }

      subject { task }

        it { should respond_to :title }
          it { should respond_to :description }
            it { should respond_to :status }


              it "has a default status of incomplete" do
                    task.status.should eq("incomplete")
                      end

                it "creates timestamp on initialize" do
                      task.created_at.should_not be_nil
                        end

                  it "has a time as a timestamp" do
                        task.created_at.should be_a_kind_of(Time)
                          end

                    describe "#mark_as_complete!" do
                          it "should be complete when marked as complete" do
                                  task.mark_as_complete!
                                        task.status.should eq("complete")
                                            end
                            end

                      describe "#mark_as_incomplete!" do
                            it "should be incomplete when marked as incomplete" do
                                    task.mark_as_incomplete!
                                          task.status.should eq("incomplete")
                                              end
                              end

                        describe '#complete?' do
                              it 'returns a boolean' do
                                      task.complete?.should == true || task.complete?.should == false
                                          end
                                end
end

describe TodoList do
    let(:list) { TodoList.new(title: "Phil's List", tasks: []) }

      subject { list }

        it { should respond_to :title }

          it "should have many tasks" do
                expect(list.tasks.length).to be >= 0
                  end

            describe '#add_task' do
                  it "should create a task" do
                          expect {
                                    list.add_task(Task.new(title: "Dog", description: "Walk the dog"))
                                          }.to change { list.tasks.length }.by(1)
                                              end
                    end

              describe '#complete_all!' do
                    it "should mark all tasks as complete" do
                            list.tasks.sample.complete?.should eq(true)
                                end
                      end
end
