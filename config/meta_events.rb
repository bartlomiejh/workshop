global_events_prefix :v

version 1, '2015-06-24' do
  category :user do
    event :sign_in, introduced: '2015-06-24', desc: 'user signed in'
    event :profile, introduced: '2015-06-24', desc: 'user viewed profile page'
  end

  category :review do
    event :create, introduced: '2015-06-24', desc: 'user created review'
  end

  category :product do
    event :create, introduced: '2015-06-24', desc: 'user created product'
  end

  category :category do
    event :index, introduced: '2015-06-24', desc: 'displayed category list'
    event :create, introduced: '2015-06-24', desc: 'user created category'
  end
end
