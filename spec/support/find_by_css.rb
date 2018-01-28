module FindByCss
  def find_data_test(value)
    find(:dt, value)
  end

  def find_id(value)
    find(:id, value)
  end
end
