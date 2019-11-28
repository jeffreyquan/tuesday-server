User.destroy_all
u1 = User.create :name => "Jeffrey", :email => "jeffrey@ga.co", :admin => true, :password_digest => BCrypt::Password.create('chicken')
u2 = User.create :name => "Jin", :email => "jin@ga.co", :admin => false, :password_digest => BCrypt::Password.create('chicken')
u3 = User.create :name => "Shaneen", :email => "shaneen@ga.co", :admin => false, :password_digest => BCrypt::Password.create('chicken')
u4 = User.create :name => "Ben", :email => "ben@ga.co", :admin => false, :password_digest => BCrypt::Password.create('chicken')
u5 = User.create :name => "John", :email => "john@ga.co", :admin => false, :password_digest => BCrypt::Password.create('chicken')
u6 = User.create :name => "David", :email => "david@ga.co", :admin => false, :password_digest => BCrypt::Password.create('chicken')
puts "#{ User.count } users created."

Project.destroy_all
p1 = Project.create :name => "1 Bligh Street", :description => "Commercial High Rise"
p2 = Project.create :name => "Wallstreet Hub", :description => "Web app to display stocks and create watchlists"
p3 = Project.create :name => "Local Food Festival", :description => "Preparation for local food festival at Balmain"
p4 = Project.create :name => "Two-Way Petting Zoo", :description => "You pet the animals, they pet you back"
puts "#{ Project.count } projects created."

Membership.destroy_all
m1 = Membership.create :admin => true, :invitation => true, :email => "jeffrey@ga.co"
m2 = Membership.create :admin => false, :invitation => true, :email => "jin@ga.co"
m3 = Membership.create :admin => false, :invitation => false, :email => "shaneen@ga.co"

m4 = Membership.create :admin => false, :invitation => false, :email => "jeffrey@ga.co"
m5 = Membership.create :admin => true, :invitation => true, :email => "jin@ga.co"
m6 = Membership.create :admin => false, :invitation => true, :email => "shaneen@ga.co"

m7 = Membership.create :admin => false, :invitation => false, :email => "jeffrey@ga.co"
m8 = Membership.create :admin => true, :invitation => true, :email => "shaneen@ga.co"
m9 = Membership.create :admin => false, :invitation => true, :email => "jin@ga.co"

m10 = Membership.create :admin => true, :invitation => true, :email => "ben@ga.co"
m11 = Membership.create :admin => false, :invitation => false, :email => "jeffrey@ga.co"
m12 = Membership.create :admin => false, :invitation => false, :email => "jin@ga.co"
m13 = Membership.create :admin => false, :invitation => false, :email => "shaneen@ga.co"
puts "#{ Membership.count } memberships created."

Task.destroy_all
t1 = Task.create :name => "Draft design and construction program", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Jeffrey"
t2 = Task.create :name => "Prepare project management plan", :status => "Done", :due_date => "2019-11-24", :priority => "Medium", :owner => "Jeffrey"
t3 = Task.create :name => "Draft DA package review", :status => "Working On It", :due_date => "2019-11-27", :priority => "High", :owner => "Jeffrey"
t4 = Task.create :name => "Engage architect for detailed design", :status => "Stuck", :due_date => "2019-11-30", :priority => "High", :owner => "Jeffrey"
t5 = Task.create :name => "Tender pacakge for design consultants", :status => "Done", :due_date => "2019-11-17", :priority => "Low", :owner => "Jeffrey"
t6 = Task.create :name => "Review of quotations received", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Jeffrey"
t7 = Task.create :name => "Finalise contract for consultants", :status => "Stuck", :due_date => "2019-11-25", :priority => "High", :owner => "Jeffrey"
t8 = Task.create :name => "Site inspection with design team and other stakeholders", :status => "Working On It", :due_date => "2019-12-12", :priority => "High", :owner => "Jeffrey"
t9 = Task.create :name => "Review of DA conditions", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Jeffrey"
t10 = Task.create :name => "Prepare tender documentation for main contractor", :status => "Done", :due_date => "2019-11-24", :priority => "Medium", :owner => "Jeffrey"
t11 = Task.create :name => "Assess monthly progress claim", :status => "Working On It", :due_date => "2019-11-27", :priority => "High", :owner => "Jeffrey"
t12 = Task.create :name => "Prepare cost report and risk register", :status => "Stuck", :due_date => "2019-11-30", :priority => "High", :owner => "Jeffrey"
t13 = Task.create :name => "Review safety management report", :status => "Done", :due_date => "2019-11-17", :priority => "Low", :owner => "Jeffrey"
t14 = Task.create :name => "Review all claims with project manager", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Jeffrey"
t15 = Task.create :name => "Agenda for meeting with Mark", :status => "Stuck", :due_date => "2019-11-25", :priority => "High", :owner => "Jeffrey"
t16 = Task.create :name => "Start working on tender packages", :status => "Working On It", :due_date => "2019-12-12", :priority => "High", :owner => "Jeffrey"

t17 = Task.create :name => "Explore various APIs", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Jin"
t18 = Task.create :name => "Research into stocks and information", :status => "Done", :due_date => "2019-11-24", :priority => "Medium", :owner => "Jin"
t19 = Task.create :name => "Have a look at the existing platforms and note differences", :status => "Working On It", :due_date => "2019-11-27", :priority => "High", :owner => "Jin"
t20 = Task.create :name => "Wire diagrams for each screen", :status => "Stuck", :due_date => "2019-11-30", :priority => "High", :owner => "Jin"
t21 = Task.create :name => "Prepare list of required functionality", :status => "Done", :due_date => "2019-11-17", :priority => "Low", :owner => "Jin"
t22 = Task.create :name => "Determine color scheme", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Jin"
t23 = Task.create :name => "Read up about Rails validation", :status => "Stuck", :due_date => "2019-11-25", :priority => "High", :owner => "Jin"
t24 = Task.create :name => "Set up models", :status => "Working On It", :due_date => "2019-12-12", :priority => "High", :owner => "Jin"
t25 = Task.create :name => "Set up controllers", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Jin"
t26 = Task.create :name => "Read about portfolio management", :status => "Done", :due_date => "2019-11-24", :priority => "Medium", :owner => "Jin"
t27 = Task.create :name => "Meeting with potential uses to get feedback", :status => "Working On It", :due_date => "2019-11-27", :priority => "High", :owner => "Jin"
t28 = Task.create :name => "Implement live update", :status => "Stuck", :due_date => "2019-11-30", :priority => "High", :owner => "Jin"
t29 = Task.create :name => "Link to different funds", :status => "Done", :due_date => "2019-11-17", :priority => "Low", :owner => "Jin"
t30 = Task.create :name => "Create a follow feature", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Jin"
t31 = Task.create :name => "Create a like feature", :status => "Stuck", :due_date => "2019-11-25", :priority => "High", :owner => "Jin"
t32 = Task.create :name => "Testing functionality", :status => "Working On It", :due_date => "2019-12-12", :priority => "High", :owner => "Jin"

t33 = Task.create :name => "Prepare list of potential food stalls", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Shaneen"
t34 = Task.create :name => "Call and email each food stall to arrange meeting", :status => "Done", :due_date => "2019-11-24", :priority => "Medium", :owner => "Shaneen"
t35 = Task.create :name => "Notify council of intention to hold food festival", :status => "Working On It", :due_date => "2019-11-27", :priority => "High", :owner => "Shaneen"
t36 = Task.create :name => "Get quotes for security and compare prices", :status => "Stuck", :due_date => "2019-11-30", :priority => "High", :owner => "Shaneen"
t37 = Task.create :name => "Organise advertisement on Facebook", :status => "Done", :due_date => "2019-11-17", :priority => "Low", :owner => "Jin"
t38 = Task.create :name => "Review all roles required for the day", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Jin"
t39 = Task.create :name => "Organise meeting with volunteers and distribute tasks", :status => "Stuck", :due_date => "2019-11-25", :priority => "High", :owner => "Jin"
t40 = Task.create :name => "Arrange for fencing to perimeter", :status => "Working On It", :due_date => "2019-12-12", :priority => "High", :owner => "Jin"
t41 = Task.create :name => "Organise portable freezer and fridge", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Jin"
t42 = Task.create :name => "Prepare contigency plan for rain", :status => "Done", :due_date => "2019-11-24", :priority => "Medium", :owner => "Jin"
t43 = Task.create :name => "Review prices proposed by various stalls", :status => "Working On It", :due_date => "2019-11-27", :priority => "High", :owner => "Jin"
t44 = Task.create :name => "Review menu items for each stall", :status => "Stuck", :due_date => "2019-11-30", :priority => "High", :owner => "Jin"
t45 = Task.create :name => "Organise radio advertisement", :status => "Done", :due_date => "2019-11-17", :priority => "Low", :owner => "Jin"
t46 = Task.create :name => "Plan layout including emergency exits", :status => "Done", :due_date => "2019-11-25", :priority => "High", :owner => "Jin"
t47 = Task.create :name => "Traffic management plan to council", :status => "Stuck", :due_date => "2019-11-25", :priority => "High", :owner => "Jin"
t48 = Task.create :name => "Notify local police and residence", :status => "Working On It", :due_date => "2019-12-12", :priority => "High", :owner => "Jin"

t49 = Task.create :name => "Arrange for sheep", :status => "Working On It", :due_date => "2019-12-12", :priority => "High", :owner => "Ben"
puts "#{ Task.count } tasks created."

Group.destroy_all
g1 = Group.create :name => "Phase 1"
g2 = Group.create :name => "Phase 2"
g3 = Group.create :name => "Jin's Tasks"
g4 = Group.create :name => "Shaneen's tasks"
g5 = Group.create :name => "Shaneen's Tasks"
g6 = Group.create :name => "Jin's Tasks"
g7 = Group.create :name => "Pets"
puts "#{ Group.count } groups created."

p1.groups << g1 << g2
p2.groups << g3 << g4
p3.groups << g5 << g6
p4.groups << g7
puts "Projects and Groups."

p1.memberships << m1 << m2 << m3
p2.memberships << m4 << m5 << m6
p3.memberships << m7 << m8 << m9
p4.memberships << m10 << m11 << m12 << m13
puts "Projects and Memberships."

u1.memberships << m1 << m4 << m7 << m11
u2.memberships << m2 << m5 << m9 << m12
u3.memberships << m3 << m6 << m8 << m13
u4.memberships << m10
puts "Users and Memberships."

g1.tasks << t1 << t2 << t3 << t4 << t5
g2.tasks << t6 << t7 << t8 << t9 << t10 << t11 << t12 << t13 << t14 << t15 << t16
g3.tasks << t17 << t18 << t19 << t20 << t21 << t22 << t23 << t24
g4.tasks << t25 << t26 << t27 << t28 << t29 << t30 << t31 << t32
g5.tasks << t33 << t34 << t35 << t36
g6.tasks << t37 << t38 << t39 << t40 << t41 << t42 << t43 << t44 << t45 << t46 << t47 << t48
g7.tasks << t49
puts "Groups and Tasks."
