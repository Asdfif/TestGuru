module TestPassagesHelper

  def time_left
    ((@test_passage.test.timer * 60) - (Time.now - @test_passage.created_at)).to_i 
  end

end
