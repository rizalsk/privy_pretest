User.destroy_all
User.create([{
    username: "admin",
    email: 'admin@example.com',
    password_digest: BCrypt::Password.create('password')
},
{
    username: "john",
    email: 'john@example.com',
    password_digest: BCrypt::Password.create('password')
},
{
    username: 'robert',
    email: 'robert@example.com',
    password_digest: BCrypt::Password.create('password')
},
{
    username: 'tina',
    email: 'tina@example.com',
    password_digest: BCrypt::Password.create('password')
}])

Bank.destroy_all
Bank.create([{
    name: "BCA",
    code: '014',
},{
    name: "BII",
    code: '016',
},{
    name: "BRI",
    code: '002',
},{
    name: "DANAMON",
    code: '011',
},{
    name: "MANDIRI",
    code: '008',
},{
    name: "MEGA",
    code: '426',
},{
    name: "BNI",
    code: '009',
},{
    name: "CENTURY",
    code: '095',
}])