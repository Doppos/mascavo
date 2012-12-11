puts 'CREATING ROLES'
Role.create([
  { :name => 'admin' },
  { :name => 'account' },
  { :name => 'user' }
], :without_protection => true)