class Image
  def initialize(inArray)
    @img = inArray
    @ones = collectOnes
  end

  def printArray(arrayToPrint)
    arrayToPrint.each do |i|
      i.each do |j|
        print j 
        print " "
      end
      print "\n"
    end
    print "\n"
    print "\n"
  end

  def print1DArray(array1DToPrint)
    array1DToPrint.each do |i|
      print i
      print " "
    end
    print "\n"
  end

  def output_image
    printArray(@img)
  end

  def collectOnes
    ones = []
    @img.each_with_index do |i, ii|
      @img[ii].each_with_index do |j, jj|
        if @img[ii][jj] == 1
          ones << [ii, jj]
        end
      end
    end
    return ones
  end

  def manhattanDistanceCalculate(point1, point2)
    dif1 = point1[0] - point2[0]
    dif2 = point1[1] - point2[1]
    # print((point1[0] - point2[0]).abs + (point1[1] - point2[1]).abs)
    dif1.abs + dif2.abs
  end

  def blurPoint?(searchPoint, blurDistance)
    tf = []
    @ones.each do |i|
      if manhattanDistanceCalculate(searchPoint, i) <= blurDistance
        tf << true
      else
        tf << false
      end
    end
    if tf.any? == true
      return true
    else
      return false
    end
  end

  def manhattanBlur(blurDistance)
    @img.each_with_index do |i, ii|
      @img[ii].each_with_index do |j, jj|
        pair = [ii,jj]
        if blurPoint?(pair,blurDistance)
          @img[ii][jj] = 1
        #else
          #@img[ii][jj] = 0
        end
      end
    end
    output_image
  end

end


img = Image.new([
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
])



img.manhattanBlur(3)

