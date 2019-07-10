
class Image
  def initialize(inArray)
    @img = inArray
  end
  def output_image
    @img[1][1] = 1
    @img.each do |i|
      i.each do |j|
        print j
      end
      print "\n"
    end

  end
  def pixel_transform()
    outarr=Array.new
    @img.each do |i|
      outarr << i.dup
    end

    for i in 0..outarr.length - 1
      for j in 0..outarr[i].length - 1
        if outarr[i][j] == 1
          if i.to_int > 0
            @img[i - 1].delete_at(j)
            @img[i - 1].insert(j,1)
          end
          if i < outarr.length - 1
            @img[i + 1].delete_at(j)
            @img[i + 1].insert(j,1)
          end
          if j > 0
            @img[i].delete_at(j-1)
            @img[i].insert(j-1,1)
          end
          if j < outarr[i].length - 1
            @img[i].delete_at(j+1)
            @img[i].insert(j+1,1)
          end
        end
      end
    end


      @img.each do |ii|
        ii.each do |jj|
          print jj
        end
        print "\n"
    end

  end
end

img = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
  ])




#puts(img)
#img.output_image
img.pixel_transform()












