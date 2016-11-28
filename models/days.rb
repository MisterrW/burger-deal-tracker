class Day
  attr_reader :name, :id
  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
  end

  def self.all
    sql = "
    SELECT * FROM days
    ;"
    result = SqlRunner.run(sql)
    result.map{|hash| Day.new(hash)}
  end

end