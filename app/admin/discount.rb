ActiveAdmin.register Discount do
  permit_params :name,:percent, :description, :start_date, :end_date, :status

  filter :name, as: :select
  filter :percent, as: :range_select

  scope :oncoming
  scope :happening
  scope :finished

  index do
    column :id
    column :name
    column :status
    actions
  end

  show do
    h3 discount.name
    div do
      discount.description.html_safe
    end
    div do
      discount.status
    end
    div do
      discount.start_date
      discount.end_date
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :status
      f.input :name
      f.input :percent
      f.input :description, as: :ckeditor
      f.input :start_date, as: :datepicker
      f.input :end_date, as: :datepicker
    end
    f.actions
  end
end
