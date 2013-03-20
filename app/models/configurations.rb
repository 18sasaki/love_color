class Configurations < ActiveRecord::Base
  attr_accessible :deleted, :key, :value1, :value2
  # attr_accessible :title, :body


  def self.get_sort(key_name)
  	key_str = 'sort_' + key_name
  	if config = Configurations.find(:first, :conditions => {:key => key_str})
  		ret_sort = config.value1.to_i + 1
	  	config.update_attributes({'value1' => ret_sort})
  	else
	    new_config = Configurations.new({'key' => key_str, 'value1' => 1})
	    new_config.save!
	    ret_sort = 1
  	end
  	ret_sort
  end

end
