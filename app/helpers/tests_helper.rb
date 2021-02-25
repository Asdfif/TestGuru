module TestsHelper

  def test_level(test)
    case test.level
    when (0..1) then t('.easy')
    when (2..4) then t('.medium')
    when (5..Float::INFINITY) then t('.hard')
    end
  end

end
