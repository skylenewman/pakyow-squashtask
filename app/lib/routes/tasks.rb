require 'pp'
Pakyow::App.routes(:tasks) do
  expand :restful, :task, '/tasks' do


    collection do

      post 'complete/:id' do
        task = Task[params[:id]]
        task.completed_at = DateTime.now
        task.save
        redirect '/tasks'
      end

      post 'delete/:id' do
        task = Task[params[:id]]
        task.delete
        redirect '/tasks'
      end

      get 'websocket' do
        view.scope(:task).mutate(
          :list,
          with: data(:task).for_default_post
        ).subscribe
      end


    end


    action :new do

    end



    action :create do
      task = Task.new
      task.name = params[:name]
      task.due_on = DateTime.strptime(params[:due_on],'%m/%d/%Y')
      task.save
      redirect '/tasks'
    end


    action :list do
      tasks = Task.all
      view.scope(:task).apply(tasks)
    end


    action :show do
      puts ':show'
    end


    action :edit do
      puts ':edit'
    end


    action :update do
      puts ':update'
    end

  end
end
