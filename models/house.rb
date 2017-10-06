require_relative("../db/sql_runner")

class House

  attr_reader(:id, :house_id)
  attr_accessor(:name)

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @name = details["name"]
  end

  def save()
    sql = 'INSERT INTO houses (name) VALUES ($1) RETURNING id;'
    values = [@name]
    houses = SqlRunner.run(sql, values).first
    @id = houses['id'].to_i
  end

  def self.all ()
    sql = 'SELECT * FROM houses;'
    values= []
    house_hash = SqlRunner.run(sql, values)
    houses = house_hash.map { |house| House.new(house) }
    return houses
  end

  def self.find_id(id)
    sql = 'SELECT * FROM houses WHERE id = $1;'
    values = [id]
    houses_hash = SqlRunner.run(sql, values)
    house = House.new( houses_hash[0] )
    # houses = house_hash.map { |house| house.new(house) }
    return house
  end

  def self.delete_all()
    sql = 'DELETE FROM houses;'
    values = []
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM houses WHERE id = $1;'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = 'UPDATE houses SET (name) =
      ($1) WHERE id = $2;'
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end


end
