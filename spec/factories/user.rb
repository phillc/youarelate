Factory.sequence :name do |n|
  "someuser#{n}"
end

Factory.define :user do |u|
    u.name Factory.next(:name)
end
