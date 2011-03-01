authorization do
  role :Admin do
    has_permission_on [:users, :roles], :to => [:index, :show, :new, :create, :edit, :destroy]
  end
  
  role :guest do
  end
end