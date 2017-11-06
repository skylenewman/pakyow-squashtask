Pakyow::App.bindings :tasks do
  require "pp"
  scope :task do
    restful :task

    binding(:complete_form) do
      css_class = ""
      unless bindable.completed_at.nil?
        css_class = "hidden"
      end
      {
        :action => "/tasks/complete/#{bindable.id}",
        :method => "post",
        :class => css_class
      }
    end # binding(:complete_form) do

    binding(:delete_form) do
      css_class = ""
      unless bindable.completed_at.nil?
        css_class = "hidden"
      end
      {
        :action => "/tasks/delete/#{bindable.id}",
        :method => "post",
        :class => css_class
      }
    end # binding(:delete_form) do

    binding(:due) do
      css_class = ''
      unless bindable.completed_at.nil?
        css_class = 'strikethrough'
      end
      {
        :content => "Due on #{bindable.due_on.strftime('%m/%d/%Y')}",
        :class => css_class
      }
    end

    binding(:completed) do
      content = ''
      unless bindable.completed_at.nil?
        content = "Completed #{bindable.completed_at.strftime('%m/%d/%Y')}"
      end
      {
        :content => content
      }
    end
  end
end
