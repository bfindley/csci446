authorization do
  role :Admin do
    has_permission_on :roles, :to => [:index, :show, :new, :create, :edit, :destroy, :update]
    has_permission_on :users, :to => [:index, :show, :edit, :destroy, :update]
    has_permission_on :user_sessions, :to => [:new, :destroy, :create]
  end

  role :Member do
    has_permission_on :users, :to => [:show] 
    has_permission_on :user_sessions, :to => [:new, :destroy, :create  ]
    has_permission_on :users, :to => [:edit, :update] do
      if_attribute :id => is { user.id }
    end
  end
  
  role :guest do
    has_permission_on :user_sessions, :to => [:new, :destroy, :create ]
    has_permission_on :users, :to => [:new, :create ]
  end
end