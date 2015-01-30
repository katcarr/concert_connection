class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  validates(:name, :presence => true)
  before_save(:capitalize_name)


  private


  define_method(:capitalize_name) do
    cap_name = self.name.split(" ")
    cap_name.each() do |word|
      word.capitalize!()
    end

    self.name = cap_name.join(" ")

  end

end
