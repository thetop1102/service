ActiveAdmin.register Place do
  permit_params :name, :description, :image, :cover
  filter :name, as: :select

  index do
    column :id
    column :name do |place|
      link_to place.name, admin_place_path(place)
    end
    column :decription do |place|
      truncate(place.description.html_safe) if place.description
    end
  end

  show do
    h3 place.name
    div do
      place.description.html_safe if place.description
    end
    div do
      image_tag place.image
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :name
      f.input :description, as: :ckeditor
      f.input :image, as: :url
      f.input :cover, as: :url
    end
    f.actions
    end
end
