require 'lib/shitbrix.rb'

describe ShitBrix do          
  it "should inject dependencies described(bind) in different nested modules" do
    require 'test/samples/test_app_nested_modules.rb'
    app = Application.new
    app.do_real_work.should == "work"
 
    app.dispatcher.class.should == Dispatcher
    app.dispatcher.action.class.should == Action
    app.dispatcher.action.service.class.should == Service
  end
end