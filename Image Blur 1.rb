class Image
  def initialize(inArray)
    @img = inArray
  end
  def output_image
    @img.each do |i|
      i.each do |j|
        print j
      end
      print "\n"
    end
  end
end

img = Image.new([
    [0, 0, 0, 0],
    [0, 1, 0, 0],
    [0, 0, 0, 1],
    [0, 0, 0, 0]
  ])



img.output_image