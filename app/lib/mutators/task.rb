Pakyow::app.mutators :task do
  mutator :list do |view,data|
    view.apply(data)
  end
end
