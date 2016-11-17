ActiveAdmin.register Payment do
  index do
    id_column
    column :amount
    column :created_at
  end
end
