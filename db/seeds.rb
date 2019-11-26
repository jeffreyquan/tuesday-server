User.destroy_all

u1 = User.create :name => "Jeffrey", :email => "jeffrey@ga.co", :admin => true, :password_digest => BCrypt::Password.create('chicken')
u2 = User.create :name => "Jin", :email => "jin@ga.co", :admin => false, :password_digest => BCrypt::Password.create('chicken')
u3 = User.create :name => "Shaneen", :email => "shaneen@ga.co", :admin => false, :password_digest => BCrypt::Password.create('chicken')
u4 = User.create :name => "Ben", :email => "ben@ga.co", :admin => false, :password_digest => BCrypt::Password.create('chicken')
u5 = User.create :name => "John", :email => "david@ga.co", :admin => false, :password_digest => BCrypt::Password.create('chicken')
u6 = User.create :name => "David", :email => "david@ga.co", :admin => false, :password_digest => BCrypt::Password.create('chicken')
puts "#{ User.count } users created."

Project.destroy_all
p1 = Project.create :name => "Reverse Petting Zoo", :description => "Event planning for a petting zoo"
p2 = Project.create :name => "Wallstreet Hub", :description => "Web app to display stocks and create watchlists"
p3 = Project.create :name => "Creative Contacts App", :description => "Web app to store all contacts into custom groups"
puts "#{ Project.count } projects created."

Membership.destroy_all
m1 = Membership.create :admin => true, :invitation => true, :email => "jeffrey@ga.co"
m2 = Membership.create :admin => false, :invitation => true, :email => "jin@ga.co"
m3 = Membership.create :admin => false, :invitation => false, :email => "shaneen@ga.co"

m4 = Membership.create :admin => false, :invitation => false, :email => "jeffrey@ga.co"
m5 = Membership.create :admin => true, :invitation => true, :email => "jin@ga.co"
m6 = Membership.create :admin => true, :invitation => true, :email => "shaneen@ga.co"

m7 = Membership.create :admin => false, :invitation => false, :email => "jeffrey@ga.co"
m8 = Membership.create :admin => true, :invitation => true, :email => "shaneen@ga.co"
m9 = Membership.create :admin => false, :invitation => true, :email => "jin@ga.co"
puts "#{ Membership.count } memberships created."

Task.destroy_all
t1 = Task.create :name => "create project plan", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Jeffrey"
t2 = Task.create :name => "draft program", :status => "Done", :due_date => "2019-11-24", :priority => "Medium", :owner => "Jeffrey"
t3 = Task.create :name => "contact event agent", :status => "Working On It", :due_date => "2019-11-27", :priority => "High", :owner => "Jeffrey"
t4 = Task.create :name => "organise venue", :status => "Stuck", :due_date => "2019-11-30", :priority => "High", :owner => "Jeffrey"
t5 = Task.create :name => "create flyers to hand out", :status => "Done", :due_date => "2019-11-17", :priority => "Low", :owner => "Jeffrey"
t6 = Task.create :name => "create project plan", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Jeffrey"
t7 = Task.create :name => "arrange for finances", :status => "Stuck", :due_date => "2019-11-25", :priority => "High", :owner => "Jeffrey"
t8 = Task.create :name => "organise animals", :status => "Working On It", :due_date => "2019-12-12", :priority => "High", :owner => "Jeffrey"

t9 = Task.create :name => "create project plan", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Jin"
t10 = Task.create :name => "draft program", :status => "Done", :due_date => "2019-11-24", :priority => "Medium", :owner => "Jin"
t11 = Task.create :name => "contact event agent", :status => "Working On It", :due_date => "2019-11-27", :priority => "High", :owner => "Jin"
t12 = Task.create :name => "organise venue", :status => "Stuck", :due_date => "2019-11-30", :priority => "High", :owner => "Jin"
t13 = Task.create :name => "create flyers to hand out", :status => "Done", :due_date => "2019-11-17", :priority => "Low", :owner => "Jin"
t14 = Task.create :name => "create project plan", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Jin"
t15 = Task.create :name => "arrange for finances", :status => "Stuck", :due_date => "2019-11-25", :priority => "High", :owner => "Jin"
t16 = Task.create :name => "organise animals", :status => "Working On It", :due_date => "2019-12-12", :priority => "High", :owner => "Jin"

t17 = Task.create :name => "create project plan", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Shaneen"
t18 = Task.create :name => "draft program", :status => "Done", :due_date => "2019-11-24", :priority => "Medium", :owner => "Shaneen"
t19 = Task.create :name => "contact event agent", :status => "Working On It", :due_date => "2019-11-27", :priority => "High", :owner => "Shaneen"
t20 = Task.create :name => "organise venue", :status => "Stuck", :due_date => "2019-11-30", :priority => "High", :owner => "Shaneen"
t21 = Task.create :name => "create flyers to hand out", :status => "Done", :due_date => "2019-11-17", :priority => "Low", :owner => "Shaneen"
t22 = Task.create :name => "create project plan", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Shaneen"
t23 = Task.create :name => "arrange for finances", :status => "Stuck", :due_date => "2019-11-25", :priority => "High", :owner => "Shaneen"
t24 = Task.create :name => "organise animals", :status => "Working On It", :due_date => "2019-12-12", :priority => "High", :owner => "Shaneen"
puts "#{ Task.count } tasks created."

Group.destroy_all
g1 = Group.create :name => "Todo"
g2 = Group.create :name => "Done"
g3 = Group.create :name => "Todo"
g4 = Group.create :name => "Done"
g5 = Group.create :name => "Todo"
g6 = Group.create :name => "Done"
puts "#{ Group.count } groups created."

p1.groups << g1 << g2
p2.groups << g3 << g4
p3.groups << g5 << g6
puts "Projects and Groups."

p1.memberships << m1 << m2 << m3
p2.memberships << m4 << m5 << m6
p3.memberships << m7 << m8 << m9
puts "Projects and Memberships."

u1.memberships << m1 << m4 << m7
u2.memberships << m2 << m5 << m9
u3.memberships << m3 << m6 << m8
puts "Users and Memberships."

g1.tasks << t1 << t2 << t3
g2.tasks << t4 << t5 << t6 << t7 << t8
g3.tasks << t9 << t10 << t11 << t12
g4.tasks << t13 << t14 << t15 << t16
g5.tasks << t17 << t18
g6.tasks << t19 << t20 << t21 << t22 << t23 << t24
puts "Groups and Tasks."
