require 'pp'

Pakyow::App.routes do
  default do
    tasks = Task.all
    view.scope(:task).apply({:count=>tasks.count})
    view.scope(:user).apply({:name=>'Kyle'})
  end

end
