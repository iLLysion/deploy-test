module Post::Contract
  class Create < Reform::Form
    property :title
    property :description

    validates :title, presence: true
    validates :description, length: { minimum: 10 }, allow_blank: true
  end
end
