Pakyow::App.mutable :task do

  query :for_default_post do
    # TODO: fix Redis impl
      #
      # redis.lrange(:tasks,0, -1).each_with_index.map { |content,id|
      #   {
      #     id: id + 1,
      #     content: content
      #   }
      # }
      Task.all
  end

  action :create do |params|
    # TODO: fix Redis impl
    # redis.lpush(:tasks, params[:content])
    task = Task.new
    task.name = params[:name]
    task.due_on = DateTime.strptime(params[:due_on],'%m/%d/%Y')
    task.save
  end
end
