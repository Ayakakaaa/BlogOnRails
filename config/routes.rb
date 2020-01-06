Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'

  # index
  get('/posts', to: 'posts#index')
  # new
  get('/posts/new', to: 'posts#new')
  post('/posts', to:'posts#create', as:'create')
  # show
  get('/posts/:id', to:'posts#show', as:'post')
  # edit
  get('/posts/:id/edit',to:'posts#edit', as:'edit_post')
  patch('/posts/:id/', to:'posts#update')
  #delete
  delete('/posts/:id', to:'posts#destroy')

  #comments
    # new
    post('/posts/:post_id/comments/create', to:'comments#create', as:'post_comments')
    #delete
    delete('/posts/:post_id/comments/:id', to:'comments#destroy', as:'post_comment')

end

