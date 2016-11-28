require_relative('../db/sql_runner')

class TempIdStore
  def self.save(id)
    sql="
    DELETE FROM temp_id_store;
    INSERT INTO temp_id_store
    (id)
    VALUES
    (#{id})
    ;"
    SqlRunner.run(sql)
  end

  def self.retrieve
    sql="
    SELECT * FROM temp_id_store
    ;"
    result = SqlRunner.run(sql)
    sql="
    DELETE FROM temp_id_store
    ;"
    return result[0]['id'].to_i
  end
end
