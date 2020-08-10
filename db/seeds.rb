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
