module ProductsHelper

  #i don't actually want this, it needs to be checkboxes
  def category_string(categories)
    string = ""
    categories.each {|category| string += (category.name + " ")}
    string
  end

end
