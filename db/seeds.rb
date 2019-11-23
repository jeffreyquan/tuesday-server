User.destroy_all

u1 = User.create :name => "Jeffrey", :email => "jeffrey@ga.co", :admin => true, :password_digest => BCrypt::Password.create('chicken')
u2 = User.create :name => "Jin", :email => "jin@ga.co", :admin => false, :password_digest => BCrypt::Password.create('chicken')
u3 = User.create :name => "Shaneen", :email => "shaneen@ga.co", :admin => false, :password_digest => BCrypt::Password.create('chicken')
puts "#{ User.count } users created."

Project.destroy_all
p1 = Project.create :name => "Project 0 - Jeffrey", :description => "reverse petting zoo"
p2 = Project.create :name => "Project 1 - Jin", :description => "Wallstreet Hub Web App"
p3 = Project.create :name => "Project 2 - Shaneen", :description => "Phone Contacts App"
puts "#{ Project.count } projects created."

Membership.destroy_all
m1 = Membership.create :admin => false, :invitation => true, :email => "jin@ga.co"
m2 = Membership.create :admin => false, :invitation => false, :email => "shaneen@ga.co"

m3 = Membership.create :admin => false, :invitation => false, :email => "jeffrey@ga.co"
m4 = Membership.create :admin => true, :invitation => false, :email => "jin@ga.co"

m5 = Membership.create :admin => false, :invitation => false, :email => "jeffrey@ga.co"
m6 = Membership.create :admin => false, :invitation => true, :email => "shaneen@ga.co"
puts "#{ Membership.count } memberships created."

Task.destroy_all
t1 = Task.create :name => "create project plan", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Jeffrey", :group => "Done"
t2 = Task.create :name => "draft program", :status => "Done", :due_date => "2019-11-24", :priority => "Medium", :owner => "Jeffrey", :group => "Done"
t3 = Task.create :name => "contact event agent", :status => "Working On It", :due_date => "2019-11-27", :priority => "High", :owner => "Jeffrey", :group => "external consultants"
t4 = Task.create :name => "organise venue", :status => "Stuck", :due_date => "2019-11-30", :priority => "High", :owner => "Jeffrey", :group => "external consultants"
t5 = Task.create :name => "create flyers to hand out", :status => "Done", :due_date => "2019-11-17", :priority => "Low", :owner => "Jeffrey", :group => "Done"
t6 = Task.create :name => "create project plan", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Jeffrey", :group => "Done"
t7 = Task.create :name => "arrange for finances", :status => "Stuck", :due_date => "2019-11-25", :priority => "High", :owner => "Jeffrey", :group => "Help me"
t8 = Task.create :name => "organise animals", :status => "Working On It", :due_date => "2019-12-12", :priority => "High", :owner => "Jeffrey", :group => "Help me"

t9 = Task.create :name => "create project plan", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Jeffrey", :group => "Done"
t10 = Task.create :name => "draft program", :status => "Done", :due_date => "2019-11-24", :priority => "Medium", :owner => "Jeffrey", :group => "Done"
t11 = Task.create :name => "contact event agent", :status => "Working On It", :due_date => "2019-11-27", :priority => "High", :owner => "Jeffrey", :group => "external consultants"
t12 = Task.create :name => "organise venue", :status => "Stuck", :due_date => "2019-11-30", :priority => "High", :owner => "Jeffrey", :group => "external consultants"
t13 = Task.create :name => "create flyers to hand out", :status => "Done", :due_date => "2019-11-17", :priority => "Low", :owner => "Jeffrey", :group => "Done"
t14 = Task.create :name => "create project plan", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Jeffrey", :group => "Done"
t15 = Task.create :name => "arrange for finances", :status => "Stuck", :due_date => "2019-11-25", :priority => "High", :owner => "Jeffrey", :group => "Help me"
t16 = Task.create :name => "organise animals", :status => "Working On It", :due_date => "2019-12-12", :priority => "High", :owner => "Jeffrey", :group => "Help me"

t17 = Task.create :name => "create project plan", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Jeffrey", :group => "Done"
t18 = Task.create :name => "draft program", :status => "Done", :due_date => "2019-11-24", :priority => "Medium", :owner => "Jeffrey", :group => "Done"
t19 = Task.create :name => "contact event agent", :status => "Working On It", :due_date => "2019-11-27", :priority => "High", :owner => "Jeffrey", :group => "external consultants"
t20 = Task.create :name => "organise venue", :status => "Stuck", :due_date => "2019-11-30", :priority => "High", :owner => "Jeffrey", :group => "external consultants"
t21 = Task.create :name => "create flyers to hand out", :status => "Done", :due_date => "2019-11-17", :priority => "Low", :owner => "Jeffrey", :group => "Done"
t22 = Task.create :name => "create project plan", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Jeffrey", :group => "Done"
t23 = Task.create :name => "arrange for finances", :status => "Stuck", :due_date => "2019-11-25", :priority => "High", :owner => "Jeffrey", :group => "Help me"
t24 = Task.create :name => "organise animals", :status => "Working On It", :due_date => "2019-12-12", :priority => "High", :owner => "Jeffrey", :group => "Help me"
puts "#{ Task.count } tasks created."

p1.memberships << m1 << m2
p2.memberships << m3 << m4
p3.memberships << m5 << m6
puts "Projects and Memberships."

u1.memberships << m3 << m5
u2.memberships << m1 << m6
u3.memberships << m2 << m4
puts "Users and Memberships."

p1.tasks << t1 << t2 << t3 << t4 << t5 << t6 << t7 << t8
p2.tasks << t9 << t10 << t11 << t12 << t13 << t14 << t15 << t16
p3.tasks << t17 << t18 << t19 << t20 << t21 << t22 << t23 << t24
puts "Projects and Tasks."
