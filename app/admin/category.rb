ActiveAdmin.register Category do
  permit_params :name, :description, :cover

  filter :name_cont

  index do
    column :id
    column :name do |category|
      link_to category.name, admin_category_path(category)
    end
    column :description
  end

  show do
    h3 category.name
    div do
      raw category.description
    end
    div do
      image_tag category.cover
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :name
      f.input :description, as: :ckeditor
      f.input :cover, as: :url
    end
    f.actions
  end
end
