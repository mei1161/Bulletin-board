ActiveAdmin.register Response do
  actions :all, except: [:new, :update]
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :reply_id, :user_id, :email, :content, :ipaddress, :board_id, :deleted_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :reply_id, :user_id, :email, :content, :ipaddress, :board_id, :deleted_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  config.sort_order = "id_asc"

  form do |f|
    f.inputs do
      f.input :name
      f.input :content
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    column :content
    actions
  end
  
end
