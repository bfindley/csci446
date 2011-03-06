authorization do
  role :admin do
    has_permission_on :admin_roles, :to => [:index, :show, :new, :create, :edit, :destroy, :update]
    has_permission_on :admin_users, :to => [:index, :show, :edit, :destroy, :update]
    has_permission_on :user_sessions, :to => [:destroy]
    has_permission_on :admin_admin, :to => [:index]
    has_permission_on :admin_games, :to => [:new, :create, :edit, :update, :show, :index]
  end

  role :member do
    has_permission_on :member_member, :to => [:index]
    has_permission_on :user_sessions, :to => [:destroy]
    has_permission_on :member_users, :to => [:show] 
    has_permission_on :member_games, :to => [:new, :create, :index]
    has_permission_on :member_users, :to => [:edit, :update] do
      if_attribute :id => is { user.id }
    end
    has_permission_on :member_games, :to => [:edit, :update] do
      if_attribute :user_id => is { user.id }
    end
  end
  
  role :guest do
    has_permission_on :user_sessions, :to => [:new, :destroy, :create ]
    has_permission_on :users, :to => [:new, :create ]
    has_permission_on :games, :to => [ :index ]
  end
end