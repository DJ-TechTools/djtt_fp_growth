require 'djtt_fp_growth/djtt_fp_growth'
require 'tmpdir'
require 'tempfile'

class DjttFpGrowth
  def self.run(transactions, tempdir=Dir.tmpdir)
    input = File.open("#{tempdir}/transactions", "w")
    begin
      transactions.each do |transaction|
        input.write("#{transaction.join(" ")}\n")
      end
    ensure
       input.close
    end

    DjttFpGrowth.run_fp_growth ["djtt_fp_growth", "-w", "-s1", "#{tempdir}/transactions", "#{tempdir}/results"]

    File.read("#{tempdir}/results").split("\n").collect do |item| 
      data = item.split(" ")
      support = data.pop
      data + [support.sub("(","").sub(")","").to_i]
    end
  end

  def self.help
    DjttFpGrowth.run_fp_growth ["djtt_fp_growth"]
  end
  
end