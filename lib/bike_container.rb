module BikeContainer

	DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||=[]
	end

	def capacity
		capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity =value
	end

	def dock(bike)
		raise "Docking Station is full" if full?
		raise "Not a bike" if !bike.is_a? Bike
		bikes << bike
	end

	def release(bike)
		raise "Docking Station is empty" if empty?
		bikes.delete(bike) if bike.broken? == false
	end

	def full?
		bikes.count >= capacity
	end

	def empty?
		bikes.count == 0
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end

	def broken_bikes
		bikes.select {|bike| bike.broken?}
	end

end