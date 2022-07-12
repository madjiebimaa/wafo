# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create User
user_satu = User.create(email: 'user_satu@gmail.com', username: 'user_satu', password: 'user_satu')
user_dua = User.create(email: 'user_dua@gmail.com', username: 'user_dua', password: 'user_dua')
user_tiga = User.create(email: 'user_tiga@gmail.com', username: 'user_tiga', password: 'user_tiga')
user_empat = User.create(email: 'user_empat@gmail.com', username: 'user_empat', password: 'user_empat')
user_lima = User.create(email: 'user_lima@gmail.com', username: 'user_lima', password: 'user_lima')

# Add Role
user_satu.as_admin({ 'firstname' => 'User', 'lastname' => 'Satu', 'phone_number' => '123456789101' })
user_dua.as_customer({ 'firstname' => 'User', 'lastname' => 'Dua', 'phone_number' => '123456789102' })
user_tiga.as_merchant({ 'name' => 'Warung Makan Padang Mas User Tiga', 'address' => 'Kampung Terindah', 'phone_number' => '123456789103',
                        'image_url' => 'https://image.shutterstock.com/image-vector/translation-restaurant-name-padang-cuisine-600w-2078744242.jpg' })
user_empat.as_merchant({ 'name' => 'Baso Mas User Empat', 'address' => 'Kampung Ternyaman', 'phone_number' => '123456789104',
                         'image_url' => 'https://image.shutterstock.com/image-vector/meatball-bowl-vector-delicious-ball-600w-2010654962.jpg' })
user_lima.as_merchant({ 'name' => 'Warteg Mas User Lima', 'address' => 'Kampung Termegah', 'phone_number' => '123456789105',
                        'image_url' => 'https://image.shutterstock.com/image-vector/warteg-traditional-restaurant-tegal-indonesian-600w-1787615603.jpg' })

# Create Item By Merchant
merchant_tiga = Merchant.find(user_tiga.role_id)
merchant_empat = Merchant.find(user_empat.role_id)
merchant_lima = Merchant.find(user_lima.role_id)

merchant_tiga.create_item({ 'name' => 'Ayam Bakar',
                            'description' => 'Ayam yang diolah dengan bahan bumbu kuning dan tambahan kecap, serta dimasak dengan cara dibakar', 'price' => 12000, 'stock' => 13, 'image_url' => 'https://image.shutterstock.com/image-photo/ayam-bakar-madu-roasted-chicken-600w-1714451680.jpg', 'served_at' => '2022-03-03T04:05:06+00:00', 'expired_at' => '2022-04-03T04:05:06+00:00' })
merchant_tiga.create_item({ 'name' => 'Ayam Goreng',
                            'description' => 'Ayam yang diolah dengan bahan bumbu kuning, serta dimasak dengan cara digoreng', 'price' => 13000, 'stock' => 12, 'image_url' => 'https://image.shutterstock.com/image-photo/ayam-goreng-bumbu-ungkep-close-600w-1760897486.jpg', 'served_at' => '2022-03-03T04:05:06+00:00', 'expired_at' => '2022-04-03T04:05:06+00:00' })
merchant_empat.create_item({ 'name' => 'Baso Malang',
                             'description' => 'baso yang terbuat dari daging sapi dah khas akan cita rasa lidah orang Malang', 'price' => 20000, 'stock' => 10, 'image_url' => 'https://image.shutterstock.com/image-photo/metball-food-karage-sushi-indonesia-600w-2168739399.jpg', 'served_at' => '2022-03-03T04:05:06+00:00', 'expired_at' => '2022-04-03T04:05:06+00:00' })
merchant_empat.create_item({ 'name' => 'Baso Medan',
                             'description' => 'baso yang terbuat dari daging ayam dah khas akan cita rasa lidah orang Medan', 'price' => 10000, 'stock' => 5, 'image_url' => 'https://image.shutterstock.com/image-photo/chicken-meatballs-glaze-on-black-600w-1023385783.jpg', 'served_at' => '2022-03-03T04:05:06+00:00', 'expired_at' => '2022-04-03T04:05:06+00:00' })
merchant_lima.create_item({ 'name' => 'Kikil Saus Kuning',
                            'description' => 'kikil lembut dan gurih dengan tambahan kuah kuning', 'price' => 50000, 'stock' => 20, 'image_url' => 'https://image.shutterstock.com/image-photo/kikil-cow-skin-spicy-flavors-600w-2094539674.jpg', 'served_at' => '2022-03-03T04:05:06+00:00', 'expired_at' => '2022-04-03T04:05:06+00:00' })
