Spree::BaseHelper.class_eval do
  def recently_viewed_count
    Spree::RecentlyViewed::Config[:recently_viewed_products_max_count].to_i
  end

  def get_recently_viewed_products_ids
    if session['recently_viewed_products'].nil?
      []
    else
      session['recently_viewed_products'].split(', ').map(&:to_i).reject{|el| el == @product.id}.last(recently_viewed_count)
    end
  end
  def get_recently_viewed_products
    Product.find_by_array_of_ids(get_recently_viewed_products_ids)
  end
end