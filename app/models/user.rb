class User < ActiveRecord::Base
    has_secure_password
    has_many :contents
    validates :email, uniqueness: true # email 하나에 대해서 여러가지 옵션
    
    # validates_uniqueness_of :email 유니크 검사를 여러개의 데이터에 적용가능함
end
