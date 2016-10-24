ActiveAdmin.register Payment do
  scope :normal
  scope :daily

  index do
    id_column
    column :amount
    column :created_at
  end
end
