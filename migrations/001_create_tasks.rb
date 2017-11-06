Sequel.migration do
  up do
    create_table :tasks do
      primary_key :id #1
      foreign_key :parent_id, :tasks
      Time :created_at
      Time :updated_at

      String :name
      Time :completed_at
      Time :due_on
    end
  end

  down do
    drop_table :tasks
  end
end
