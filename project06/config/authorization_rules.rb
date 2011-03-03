authorization do
  role :Admin do
    has_permission_on [:users, :roles], :to => [:index, :show, :new, :create, :edit, :destroy, :update]
  end

  role :Member do
    has_permission_on :users, :to => [:show] 
    has_permission_on :users, :to => [:edit] do
      if_attribute :id => is { user.id }
    end
  end
end