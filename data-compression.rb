require 'pry'


file_name = ARGV[0]

file_to_compress = File.read(file_name)

uncompressed_file = File.new("uncompressed_file.txt", 'w')



def compress_file(file_to_compress, file_name)

  compressed_file = File.new("#{file_name}_c.txt", 'w')

  i = 0
  dictionary_size = 256
  dictionary = {}

  while i < dictionary_size
    dictionary[i.chr] = i.chr
    i += 1
  end

  w = nil
  for c in file_to_compress.split('')
    wc = ([w,c].join)
    if dictionary.has_key?(wc)
      w = wc
    else
      compressed_file.write(dictionary[w])
      dictionary[wc] = dictionary_size
      dictionary_size += 1
      w = c
    end
  end

  print "Original size:\n"
  print file_to_compress.size

  print "\nCompressed size:\n"
  print compressed_file.size
end

compress_file(file_to_compress, file_name)


# DECOMPRESSION
  #
  # dictionary_size = 256
  # dictionary = {}
  #
  # i = 0
  #
  # while i < dictionary_size
  # dictionary[i.chr] = i.chr
  # i += 1
  # end
  #
  # uncompressed_file.write(compressed_file.first)
  # w = compressed_file.first
  # for c in compressed_file
  #     uncompressed_file.write(dictionary[c])
  #     w = c
  # end
  #
  #
  # print "\nUncompressed size:\n"
  # print uncompressed_file.size




























































# puts """fundamental_kant.txt.compressed created
# ________________________________________________________
# Original file name     : fundamental_kant.txt
# Compressed file name   : fundamental_kant.txt.compressed
# Original file size     : 176K
# Compressed file size   : 71K
# Compression took 0.1989 seconds
# Compressed file is 59.7% smaller than the original file
# Compression Ratio: 2.48 x
# ________________________________________________________"""
