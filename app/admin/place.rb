ActiveAdmin.register Place do
  permit_params :name, :description, :image, :cover

  index do
    column :id
    column :name
    column :decription do |place|
     truncate place.description.html_safe
    end
    actions
  end

  show do
    h3 place.name
    div do
      place.description.html_safe
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
