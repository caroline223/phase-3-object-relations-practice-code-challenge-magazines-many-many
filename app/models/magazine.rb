class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions


  def email_list
    email_arr = self.readers.map{|reader| reader.email}
    email_arr.join(";")
  end
  
  def self.most_popular
    most_popular = Magazine.all.max_by do |mag_inst|
        mag_inst.subscriptions.count 
    end
  end

end