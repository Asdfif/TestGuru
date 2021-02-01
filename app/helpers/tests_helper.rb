module TestsHelper

  TEST_LEVELS = { (0..1) => :easy, (2..4) => :medium, (5..Float::INFINITY) => :hard }.freeze

  def test_level(test)
    # byebug

    case test.level
    when (0..1)
      'easy'
    when (2..4)
      'medium'
    when (5..Float::INFINITY)
      'hard'
    end
  end

end
