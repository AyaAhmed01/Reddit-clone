class Sub < ApplicationRecord
    validates :title, presence: true, uniqueness: true  
    
    belongs_to :moderator,
        class_name: 'User',
        inverse_of: :subs

    has_many :taggings, 
        foreign_key: :sub_id, 
        class_name: 'PostSubTag',
        dependent: :destroy,
        inverse_of: :sub 

    has_many :posts, 
        through: :taggings,
        source: :post
end