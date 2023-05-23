Rails.application.routes.draw do



  # Routes for the Outing selection resource:

  # CREATE
  post("/insert_outing_selection", { :controller => "outing_selections", :action => "create" })
          
  # READ
  get("/outing_selections", { :controller => "outing_selections", :action => "index" })
  
  get("/outing_selections/:path_id", { :controller => "outing_selections", :action => "show" })
  
  # UPDATE
  
  post("/modify_outing_selection/:path_id", { :controller => "outing_selections", :action => "update" })
  
  # DELETE
  get("/delete_outing_selection/:path_id", { :controller => "outing_selections", :action => "destroy" })

  #------------------------------

  # Routes for the Invitation resource:

  # CREATE
  post("/insert_invitation", { :controller => "invitations", :action => "create" })
          
  # READ
  get("/invitations", { :controller => "invitations", :action => "index" })
  
  get("/invitations/:path_id", { :controller => "invitations", :action => "show" })
  
  # UPDATE
  
  post("/modify_invitation/:path_id", { :controller => "invitations", :action => "update" })
  
  # DELETE
  get("/delete_invitation/:path_id", { :controller => "invitations", :action => "destroy" })

  #------------------------------

  # Routes for the Outing option resource:

  # CREATE
  post("/insert_outing_option", { :controller => "outing_options", :action => "create" })
          
  # READ
  get("/outing_options", { :controller => "outing_options", :action => "index" })
  
  get("/outing_options/:path_id", { :controller => "outing_options", :action => "show" })
  
  # UPDATE
  
  post("/modify_outing_option/:path_id", { :controller => "outing_options", :action => "update" })
  
  # DELETE
  get("/delete_outing_option/:path_id", { :controller => "outing_options", :action => "destroy" })

  #------------------------------

  # Routes for the Outing resource:

  # CREATE
  post("/insert_outing", { :controller => "outings", :action => "create" })
          
  # READ
  get("/outings", { :controller => "outings", :action => "index" })
  
  get("/outings/:path_id", { :controller => "outings", :action => "show" })
  
  # UPDATE
  
  post("/modify_outing/:path_id", { :controller => "outings", :action => "update" })
  
  # DELETE
  get("/delete_outing/:path_id", { :controller => "outings", :action => "destroy" })

  #------------------------------

  # Routes for the Bookmark resource:

  # CREATE
  post("/insert_bookmark", { :controller => "bookmarks", :action => "create" })
          
  # READ
  get("/bookmarks", { :controller => "bookmarks", :action => "index" })
  
  get("/bookmarks/:path_id", { :controller => "bookmarks", :action => "show" })
  
  # UPDATE
  
  post("/modify_bookmark/:path_id", { :controller => "bookmarks", :action => "update" })
  
  # DELETE
  get("/delete_bookmark/:path_id", { :controller => "bookmarks", :action => "destroy" })

  #------------------------------

  # Routes for the Restaurant resource:

  # CREATE
  post("/insert_restaurant", { :controller => "restaurants", :action => "create" })
          
  # READ
  get("/restaurants", { :controller => "restaurants", :action => "index" })
  
  get("/restaurants/:path_id", { :controller => "restaurants", :action => "show" })
  
  # UPDATE
  
  post("/modify_restaurant/:path_id", { :controller => "restaurants", :action => "update" })
  
  # DELETE
  get("/delete_restaurant/:path_id", { :controller => "restaurants", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
