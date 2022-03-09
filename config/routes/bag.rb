scope path: :bag, controller: :bag do
   get :index
   post :delete_item
   post :quantity_item
   post :load_items
   post :view_filter
   post :filter
   resources :bag
end