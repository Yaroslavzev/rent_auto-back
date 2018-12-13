# app/models/info_model.rb
class InfoModel < Model


  def range_rates_own
    self.rentals.find_by(rental_type: 1).range_rates
  end

  def slice_rates_own #как лучше назвать метод, чтобы не было конфликтов с ActiveRecord?
   self.rentals.find_by(rental_type: 1).slice_rates
  end

end
