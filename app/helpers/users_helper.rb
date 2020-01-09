module UsersHelper

    
    def agency_id_field(user)
      if user.agency.nil?
        select_tag "user[agency_id]", options_from_collection_for_select(Agency.all, :id, :name), prompt: "Please select your Agency"
      else
        hidden_field_tag "user[agency_id]", user.agency_id
      end
    end

    def admin_field(user)
        if user.first_user?
            #disabled checkbox for first user
            check_box(nil, nil, {checked: true, disabled:true})
        else
            check_box "user[admin]", checked: false
        end
    end

    def agency_name
        @user.agency.name || nil
    end

    def default_admin_check(user)
        hidden_field_tag "user[admin]", "true" if user.first_user?
    end

    def confirm_first_user(user)
        hidden_field_tag "user[confirmed]", "true" if user.first_user?
    end
    

    


end


