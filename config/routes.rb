ActionController::Routing::Routes.draw do |map|
  map.resources :reservations

  map.resources :categories

  map.resources :sessions

  map.resources :users

  map.signup '/signup', :controller => 'users', :action => 'new'

  map.with_options :controller => 'home' do |home|
    home.ads 'ads', :action => "ads"
    home.contact 'contact', :action => "contact"
    home.courier 'courier', :action => "courier"
    home.feedback 'feedback', :action => "feedback"
    home.job 'job', :action => "job"
    home.rates 'rates', :action => "rates"
    home.terms 'terms', :action => "terms"
  end

  map.with_options :controller => "sessions" do |session|
    session.login '/login', :action => "new"
    session.logout '/logout', :action => "destroy"
  end

  map.with_options :controller => "admin" do |admin|
    admin.admin '/admin', :action => "index"
    admin.admin_login '/admin/login', :action => "login"
    admin.admin_logout '/admin/logout', :action => "logout"
  end

  map.namespace :admin do |admin|
    admin.resources :users
    admin.resources :events
    admin.resources :categories
    admin.resources :reservations
  end

  map.admin_reservations '/admin/reservations', :controller => "admin/reservations", :action => "index"

  map.root :controller => 'reservations', :action => 'new'
end

