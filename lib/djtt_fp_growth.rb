require 'djtt_fp_growth/djtt_fp_growth'
require 'tmpdir'
require 'tempfile'

class DjttFpGrowth
  def self.run(transactions, tempdir=Dir.tmpdir)
    input = Tempfile.open("transactions", tempdir)
    begin
      transactions.each do |transaction|
        input.write("#{transaction.join(" ")}\n")
      end
    ensure
       input.close
    end

    output = Tempfile.open("results", tempdir)
    output.close
    DjttFpGrowth.run_fp_growth ["djtt_fp_growth", "-w", "-s1", input.path, output.path]

    File.read(output.path).split("\n").collect do |item| 
      data = item.split(" ")
      support = data.pop
      data + [support.sub("(","").sub(")","").to_i]
    end
  end

  def self.help
    DjttFpGrowth.run_fp_growth ["djtt_fp_growth"]
  end
  
end