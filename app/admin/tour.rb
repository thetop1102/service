ActiveAdmin.register Tour do
  permit_params :name, :duration, :price, :place_id, :category_id, :description
  includes :category, :place, :discount
  filter :name_cont
  filter :place_name_cont, as: :string
  filter :category, as: :select
  filter :discount, as: :select

  index do
    selectable_column
    column :id
    column :name
    column :price do |tour|
      link_to tour.name, admin_tour_path(tour)
    end
    column :discount
    column :category
    column :place
  end

  show do
    h3 tour.name
    div do
      tour.place
      tour.category
      tour.duration
    end
    div do
      tour.description.html_safe
    end
    div do
      image_tag tour.image
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :category
      f.input :place
      f.input :name
      f.input :price
      f.input :duration
      f.input :description, as: :ckeditor
      f.input :image, as: :url
      f.input :cover, as: :url
    end
    f.actions
  end

  batch_action :add_discount,
    form: -> {{discount: Discount.pluck(:name, :id)}} do |ids, inputs|
    discount = Discount.find_by_id inputs[:discount]
    Tour.find(ids).each do |tour|
      tour.update_attributes discount: discount
    end
  end
end
