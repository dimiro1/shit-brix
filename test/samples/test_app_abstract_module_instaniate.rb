class Service
  def go()
    "work"
  end
end

class Action
  inject :service  

  def perform()
    @service.go
  end
end

class ApplicationModule < AbstractModule
  def configure()    
    bind(:service).to { Service.new }
    bind(:action).to { Action.new }   
  end
end

class Application
  def initialize
    ShitBrix.init(AbstractModule.new)    
    @action = ShitBrix.get_instance(:action)
  end

  def do_real_work    
    @action.perform
  end
end